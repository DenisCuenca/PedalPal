import 'package:flutter/material.dart';
// import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pedalpal/pages/dashboard/components/barChart.dart';
import 'package:pedalpal/pages/payment/paymentConf.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/openStreetRouteService.dart';

import "package:geolocator/geolocator.dart";

class Dashboard extends StatefulWidget {
  final Function(int) funcionCallback;
  const Dashboard({super.key, required this.funcionCallback});

  // Function(int num) callback;
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String qr_result = "no se ha escaneado, tav";

  List listOfPoints = [];
  double routeDistance = 0.0;
  double routeDuration = 0.0;

  // Conversion of listOfPoints into LatLng(Latitude, Longitude) list of points
  List<LatLng> points = [];

  // Method to consume the OpenRouteService API
  getCoordinates() async {
    // Requesting for openrouteservice api
    var response = await http.get(getRouteUrl(
        "${myPosition?.longitude},${myPosition?.latitude}",
        '-79.2151694,-3.9705911'));
    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        routeDistance =
            data['features'][0]['properties']['summary']["distance"];
        routeDuration =
            data['features'][0]['properties']['summary']["duration"];

        listOfPoints = data['features'][0]['geometry']['coordinates'];
        points = listOfPoints
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
      }
    });
  }

  void scanQr() async {
    String? cameraResult = await scanner.scan();
    setState(() {
      qr_result = cameraResult!;
    });
  }

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentlocation() async {
    Position position = await determinePosition();

    setState(() {
      myPosition = LatLng(position.latitude, position.longitude);
      print(myPosition);
    });
    getCoordinates();
  }

  LatLng? myPosition;

  @override
  void initState() {
    getCurrentlocation();
    // getCoordinates();
    super.initState();
    // TODO: implement initState
  }

  // static final LatLng _pGooglePlex = const LatLng(-3.9996913, -79.2095082);
  // static final LatLng _pdestination = const LatLng(-3.997467, -79.2065033);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
      child: Column(children: [
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Stack(
            children: [
              Container(
                  // height: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.black12,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.normal,
                        offset: const Offset(1, 2),
                      )
                    ],
                  ),
                  // child: MapboxMap(
                  //   initialCameraPosition:
                  //       CameraPosition(target: _pGooglePlex, zoom: 15),

                  // ),
                  child: myPosition == null
                      ? const Center(child: CircularProgressIndicator())
                      : FlutterMap(
                          options: MapOptions(
                            initialCenter: myPosition!,
                            initialZoom: 15,
                          ),
                          children: [
                            TileLayer(
                              additionalOptions: const {
                                "accessToken": "",
                                "id": "mapbox.mapbox-streets-v7"
                              },
                              urlTemplate:
                                  'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.example.app',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                    point: myPosition!,
                                    child: Container(
                                      // height: 60,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.location_pin,
                                        // size: 50,
                                        color: Colors.purple,
                                      ),
                                    )),
                                Marker(
                                    point:
                                        const LatLng(-3.9705911, -79.2151694),
                                    child: Container(
                                      // height: 60,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.location_pin,
                                        // size: 50,
                                        color: Colors.purple,
                                      ),
                                    )),
                              ],
                            ),
                            PolylineLayer(
                              polylineCulling: false,
                              polylines: [
                                Polyline(
                                    points: points,
                                    color: Colors.purple,
                                    strokeWidth: 4),
                              ],
                            ),
                          ],
                        )),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 20, 136, 146),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Lugar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Text(
                                    "$routeDistance pas",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      Container(
                        height: 100,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 20, 136, 146),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Icon(
                                Icons.access_time_filled_outlined,
                                color: Colors.white,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Tiempo",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Text(
                                    "${(routeDuration / 60).round()} min",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      Container(
                        height: 100,
                        width: 90,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 20, 136, 146),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.battery_charging_full_outlined,
                                color: Colors.white,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "bateria",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Text(
                                    "45%",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  )
                ],
              )
            ],
          ),
        ),

        Flexible(
            // flex: 1,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  // fit: FlexFit.tight,
                  child: InkWell(
                    onTap: () => scanQr(),
                    child: Ink(
                      height: 120,
                      // width: 110,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Icon(Icons.qr_code_rounded,
                                  color: Colors.blue[900]),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            const Text(
                              "Utiliza una bicicleta",
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "Escanear Qr",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "history");
                    },
                    child: Ink(
                      height: 120,
                      // width: 110,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Icon(Icons.cyclone_outlined,
                                  color: Colors.orange),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            const Text(
                              "Bicicletas utilizadas",
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "Mis Bicibletas",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentConf(),
                          ));
                    },
                    child: Ink(
                      height: 120,
                      // width: 110,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Icon(Icons.credit_card_rounded,
                                  color: Colors.purple),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                            const Text(
                              "Confi. forma de pagos",
                              style: TextStyle(
                                  fontSize: 8, fontWeight: FontWeight.normal),
                            ),
                            Text(
                              "Config Pago",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tus reguistros"),
            GestureDetector(
              onTap: () {
                widget.funcionCallback(2);
              },
              child: Text(
                "Ver más",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
        const Flexible(flex: 1, fit: FlexFit.tight, child: MyBarChart()),

        // const SizedBox(
        //   height: 10,
        // ),
        // Row(
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Flexible(
        //         child: Container(
        //       margin: EdgeInsets.symmetric(horizontal: 8),
        //       height: 23,
        //       color: Colors.black,
        //     )),
        //     Flexible(
        //         child: Container(
        //       margin: EdgeInsets.symmetric(horizontal: 8),
        //       height: 23,
        //       color: Colors.amber,
        //     )),
        //     Flexible(
        //         child: Container(
        //       margin: EdgeInsets.symmetric(horizontal: 8),
        //       height: 23,
        //       color: Colors.red,
        //     )),
        //     // Flexible(
        //     //   flex: 1,
        //     //   fit: FlexFit.loose,
        //     //   child: Container(
        //     //     height: 120,
        //     //     // width: 110,
        //     //     decoration: BoxDecoration(
        //     //         color: const Color.fromARGB(255, 239, 239, 239),
        //     //         borderRadius: BorderRadius.circular(7)),
        //     //     child: Padding(
        //     //       padding: const EdgeInsets.all(14),
        //     //       child: Column(
        //     //         crossAxisAlignment: CrossAxisAlignment.start,
        //     //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     //         children: [
        //     //           Container(
        //     //             child: Icon(Icons.qr_code_rounded,
        //     //                 color: Colors.blue[900]),
        //     //             height: 40,
        //     //             width: 40,
        //     //             decoration: BoxDecoration(
        //     //                 color: Colors.white,
        //     //                 borderRadius: BorderRadius.circular(7)),
        //     //           ),
        //     //           const Text(
        //     //             "Utiliza una bicicleta",
        //     //             style: TextStyle(
        //     //                 fontSize: 8, fontWeight: FontWeight.normal),
        //     //           ),
        //     //           Text(
        //     //             "Escanear Qr",
        //     //             style: TextStyle(
        //     //                 fontWeight: FontWeight.bold,
        //     //                 color: Colors.blue[900]),
        //     //           ),
        //     //         ],
        //     //       ),
        //     //     ),
        //     //   ),
        //     // ),
        //     // Flexible(
        //     //   flex: 1,
        //     //   fit: FlexFit.loose,
        //     //   child: InkWell(
        //     //     onTap: () {
        //     //       Navigator.pushNamed(context, "history");
        //     //     },
        //     //     child: Ink(
        //     //       height: 120,
        //     //       // width: 110,
        //     //       decoration: BoxDecoration(
        //     //           color: const Color.fromARGB(255, 239, 239, 239),
        //     //           borderRadius: BorderRadius.circular(7)),
        //     //       child: Padding(
        //     //         padding: const EdgeInsets.all(14),
        //     //         child: Column(
        //     //           crossAxisAlignment: CrossAxisAlignment.start,
        //     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     //           children: [
        //     //             Container(
        //     //               child: const Icon(Icons.cyclone_outlined,
        //     //                   color: Colors.orange),
        //     //               height: 40,
        //     //               width: 40,
        //     //               decoration: BoxDecoration(
        //     //                   color: Colors.white,
        //     //                   borderRadius: BorderRadius.circular(7)),
        //     //             ),
        //     //             const Text(
        //     //               "Bicicletas utilizadas",
        //     //               style: TextStyle(
        //     //                   fontSize: 8, fontWeight: FontWeight.normal),
        //     //             ),
        //     //             Text(
        //     //               "Mis Bicibletas",
        //     //               style: TextStyle(
        //     //                   fontWeight: FontWeight.bold,
        //     //                   color: Colors.blue[900]),
        //     //             ),
        //     //           ],
        //     //         ),
        //     //       ),
        //     //     ),
        //     //   ),
        //     // ),
        //     // Flexible(
        //     //   flex: 1,
        //     //   fit: FlexFit.loose,
        //     //   child: InkWell(
        //     //     onTap: () {
        //     //       Navigator.push(
        //     //           context,
        //     //           MaterialPageRoute(
        //     //             builder: (context) => PaymentConf(),
        //     //           ));
        //     //     },
        //     //     child: Ink(
        //     //       height: 120,
        //     //       // width: 110,
        //     //       decoration: BoxDecoration(
        //     //           color: const Color.fromARGB(255, 239, 239, 239),
        //     //           borderRadius: BorderRadius.circular(7)),
        //     //       child: Padding(
        //     //         padding: const EdgeInsets.all(14),
        //     //         child: Column(
        //     //           crossAxisAlignment: CrossAxisAlignment.start,
        //     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     //           children: [
        //     //             Container(
        //     //               child: const Icon(Icons.credit_card_rounded,
        //     //                   color: Colors.purple),
        //     //               height: 40,
        //     //               width: 40,
        //     //               decoration: BoxDecoration(
        //     //                   color: Colors.white,
        //     //                   borderRadius: BorderRadius.circular(7)),
        //     //             ),
        //     //             const Text(
        //     //               "Confi. forma de pagos",
        //     //               style: TextStyle(
        //     //                   fontSize: 8, fontWeight: FontWeight.normal),
        //     //             ),
        //     //             Text(
        //     //               "Config Pago",
        //     //               style: TextStyle(
        //     //                   fontWeight: FontWeight.bold,
        //     //                   color: Colors.blue[900]),
        //     //             ),
        //     //           ],
        //     //         ),
        //     //       ),
        //     //     ),
        //     //   ),
        //     // ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 16,
        // ),
        // MyBarChart()
      ]),
    );
  }
}
