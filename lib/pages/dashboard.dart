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
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String qr_result = "no se ha escaneado, tav";

  List listOfPoints = [];

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
          child: Container(
              // height: 440,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Colors.black12,
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
                                point: const LatLng(-3.9705911, -79.2151694),
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
                    )

              // padding: const EdgeInsets.only(bottom: 25),
              // child: Padding(
              //   padding: const EdgeInsets.only(bottom: 30),
              //   child: Row(
              //       crossAxisAlignment: CrossAxisAlignment.end,
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         FlutterMap(
              //           options: MapOptions(
              //             initialCenter: LatLng(51.509364, -0.128928),
              //             initialZoom: 9.2,
              //           ),
              //           children: [
              //             TileLayer(
              //               urlTemplate:
              //                   'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              //               userAgentPackageName: 'com.example.app',
              //             ),
              //           ],
              //         ),
              //         Container(
              //           height: 100,
              //           width: 90,
              //           decoration: BoxDecoration(
              //               color: const Color.fromARGB(255, 25, 163, 176),
              //               borderRadius: BorderRadius.circular(10)),
              //           child: const Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(
              //                   Icons.local_activity,
              //                   color: Colors.white,
              //                 ),
              //                 Text(
              //                   "Lugar",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //                 Text(
              //                   "4.5km",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               ]),
              //         ),
              //         Container(
              //           height: 100,
              //           width: 90,
              //           decoration: BoxDecoration(
              //               color: const Color.fromARGB(255, 25, 163, 176),
              //               borderRadius: BorderRadius.circular(10)),
              //           child: const Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(
              //                   Icons.local_activity,
              //                   color: Colors.white,
              //                 ),
              //                 Text(
              //                   "Lugar",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //                 Text(
              //                   "4.5km",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               ]),
              //         ),
              //         Container(
              //           height: 100,
              //           width: 90,
              //           decoration: BoxDecoration(
              //               color: const Color.fromARGB(255, 25, 163, 176),
              //               borderRadius: BorderRadius.circular(10)),
              //           child: const Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Icon(
              //                   Icons.local_activity,
              //                   color: Colors.white,
              //                 ),
              //                 Text(
              //                   "Lugar",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //                 Text(
              //                   "4.5km",
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               ]),
              //         ),
              //       ]),
              // ),
              ),
        ),

        const SizedBox(
          height: 15,
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
                    // onTap: () => scanQr(),
                    onTap: () => getCoordinates(),
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

        const SizedBox(
          height: 15,
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
