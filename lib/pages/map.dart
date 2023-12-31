import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pedalpal/pages/bikeDetail/rentBike.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/openStreetRouteService.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String _selectedBikeCoordinate = "-79.2151694,-3.9705911";
  List listOfPoints = [];

  // Conversion of listOfPoints into LatLng(Latitude, Longitude) list of points
  List<LatLng> points = [];

  // Method to consume the OpenRouteService API
  getCoordinates() async {
    // Requesting for openrouteservice api
    var response = await http.get(getRouteUrl(
        "${myPosition?.longitude},${myPosition?.latitude}", // user location
        _selectedBikeCoordinate)); // selected bike location
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

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
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
                                  Icons.pedal_bike_rounded,
                                  // size: 50,
                                  color: Colors.purple,
                                ),
                              )),
                          Marker(
                              point: const LatLng(-3.9927262, -79.2106354),
                              child: Container(
                                // height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.pedal_bike_rounded,
                                  // size: 50,
                                  color: Colors.purple,
                                ),
                              )),
                          Marker(
                              point: const LatLng(-4.0028509, -79.2066228),
                              child: Container(
                                // height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.pedal_bike_rounded,
                                  // size: 50,
                                  color: Colors.purple,
                                ),
                              )),
                          Marker(
                              point: const LatLng(-3.999298, -79.2034259),
                              child: Container(
                                // height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.pedal_bike_rounded,
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
        SizedBox(
          // margin: const EdgeInsets.only(left: 25),
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedBikeCoordinate = "-79.2151694,-3.9705911";
                  });
                  getCoordinates();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: 200,
                  margin: const EdgeInsets.only(right: 20, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // color: Colors.amber,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.normal,
                          offset: const Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "power-green.png",
                              ),
                              const Text(
                                "Energía\n40%",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.control_point_sharp,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      Image.asset(
                        "bike-icons.png",
                        width: 90,
                      ),
                      const Column(
                        children: [
                          Text(
                            "Plaza de San Sabastián",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "A 3km de tu ubicación",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 13),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        const RentDetail())));
                          },
                          icon: const Icon(Icons.arrow_right),
                          label: const Text("Solicitar Bicicleta"),
                          style: const ButtonStyle(

                              // MaterialColor(Colors.red, Colors.red)
                              )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedBikeCoordinate = "-79.2106354,-3.9927262";
                  });
                  print(_selectedBikeCoordinate);
                  getCoordinates();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: 200,
                  margin: const EdgeInsets.only(right: 20, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.normal,
                          offset: const Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "power-yellow.png",
                              ),
                              const Text(
                                "Energía\n40%",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.control_point_sharp,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      Image.asset(
                        "bike-icons.png",
                        width: 90,
                      ),
                      const Column(
                        children: [
                          Text(
                            "Plaza de San Sabastián",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "A 3km de tu ubicación",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 13),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_right),
                          label: const Text("Solicitar Bicicleta"),
                          style: const ButtonStyle(

                              // MaterialColor(Colors.red, Colors.red)
                              )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedBikeCoordinate = "-79.2066228,-4.0028509";
                  });
                  print(_selectedBikeCoordinate);
                  getCoordinates();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: 200,
                  margin: const EdgeInsets.only(right: 20, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.normal,
                          offset: const Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "power-yellow.png",
                              ),
                              const Text(
                                "Energía\n40%",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.control_point_sharp,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      Image.asset(
                        "bike-icons.png",
                        width: 90,
                      ),
                      const Column(
                        children: [
                          Text(
                            "Plaza de San Sabastián",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "A 3km de tu ubicación",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 13),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_right),
                          label: const Text("Solicitar Bicicleta"),
                          style: const ButtonStyle(

                              // MaterialColor(Colors.red, Colors.red)
                              )),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedBikeCoordinate = "-79.2034259,-3.999298";
                  });
                  print(_selectedBikeCoordinate);
                  getCoordinates();
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: 200,
                  margin: const EdgeInsets.only(right: 20, bottom: 10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          spreadRadius: 3,
                          blurStyle: BlurStyle.normal,
                          offset: const Offset(0, 3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "power-yellow.png",
                              ),
                              const Text(
                                "Energía\n40%",
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.control_point_sharp,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      Image.asset(
                        "bike-icons.png",
                        width: 90,
                      ),
                      const Column(
                        children: [
                          Text(
                            "Plaza de San Sabastián",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "A 3km de tu ubicación",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 13),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_right),
                          label: const Text("Solicitar Bicicleta"),
                          style: const ButtonStyle(

                              // MaterialColor(Colors.red, Colors.red)
                              )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   children: [

    //     Container(
    //       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
    //       height: 280,
    //       child: ListView(
    //         scrollDirection: Axis.horizontal,
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.all(15),
    //             width: 200,
    //             margin: const EdgeInsets.only(right: 20, bottom: 10),
    //             decoration: BoxDecoration(
    //                 color: const Color.fromARGB(255, 255, 255, 255),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.black.withOpacity(0.1),
    //                     blurRadius: 5,
    //                     spreadRadius: 3,
    //                     blurStyle: BlurStyle.normal,
    //                     offset: const Offset(0, 3),
    //                   )
    //                 ],
    //                 borderRadius: BorderRadius.circular(25)),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         Image.asset(
    //                           "power-green.png",
    //                         ),
    //                         const Text(
    //                           "Energía\n40%",
    //                           style: TextStyle(fontSize: 10),
    //                         )
    //                       ],
    //                     ),
    //                     IconButton(
    //                         onPressed: () {},
    //                         icon: const Icon(
    //                           Icons.control_point_sharp,
    //                           color: Colors.grey,
    //                         ))
    //                   ],
    //                 ),
    //                 Image.asset(
    //                   "bike-icons.png",
    //                   width: 90,
    //                 ),
    //                 const Column(
    //                   children: [
    //                     Text(
    //                       "Plaza de San Sabastián",
    //                       style: TextStyle(
    //                           fontWeight: FontWeight.bold, fontSize: 15),
    //                     ),
    //                     Text(
    //                       "A 3km de tu ubicación",
    //                       style: TextStyle(
    //                           fontWeight: FontWeight.normal, fontSize: 13),
    //                     ),
    //                   ],
    //                 ),
    //                 ElevatedButton.icon(
    //                     onPressed: () {
    //                       Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: ((context) => const RentDetail())));
    //                     },
    //                     icon: const Icon(Icons.arrow_right),
    //                     label: const Text("Solicitar Bicicleta"),
    //                     style: const ButtonStyle(

    //                         // MaterialColor(Colors.red, Colors.red)
    //                         )),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(15),
    //             width: 200,
    //             margin: const EdgeInsets.only(right: 20, bottom: 10),
    //             decoration: BoxDecoration(
    //                 color: const Color.fromARGB(255, 255, 255, 255),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.black.withOpacity(0.1),
    //                     blurRadius: 5,
    //                     spreadRadius: 3,
    //                     blurStyle: BlurStyle.normal,
    //                     offset: const Offset(0, 3),
    //                   )
    //                 ],
    //                 borderRadius: BorderRadius.circular(25)),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         Image.asset(
    //                           "power-yellow.png",
    //                         ),
    //                         const Text(
    //                           "Energía\n40%",
    //                           style: TextStyle(fontSize: 10),
    //                         )
    //                       ],
    //                     ),
    //                     IconButton(
    //                         onPressed: () {},
    //                         icon: const Icon(
    //                           Icons.control_point_sharp,
    //                           color: Colors.grey,
    //                         ))
    //                   ],
    //                 ),
    //                 Image.asset(
    //                   "bike-icons.png",
    //                   width: 90,
    //                 ),
    //                 const Column(
    //                   children: [
    //                     Text(
    //                       "Plaza de San Sabastián",
    //                       style: TextStyle(
    //                           fontWeight: FontWeight.bold, fontSize: 15),
    //                     ),
    //                     Text(
    //                       "A 3km de tu ubicación",
    //                       style: TextStyle(
    //                           fontWeight: FontWeight.normal, fontSize: 13),
    //                     ),
    //                   ],
    //                 ),
    //                 ElevatedButton.icon(
    //                     onPressed: () {},
    //                     icon: const Icon(Icons.arrow_right),
    //                     label: const Text("Solicitar Bicicleta"),
    //                     style: const ButtonStyle(

    //                         // MaterialColor(Colors.red, Colors.red)
    //                         )),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.all(15),
    //             width: 200,
    //             margin: const EdgeInsets.only(right: 20, bottom: 10),
    //             decoration: BoxDecoration(
    //                 color: const Color.fromARGB(255, 255, 255, 255),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     color: Colors.black.withOpacity(0.1),
    //                     blurRadius: 5,
    //                     spreadRadius: 3,
    //                     blurStyle: BlurStyle.normal,
    //                     offset: const Offset(0, 3),
    //                   )
    //                 ],
    //                 borderRadius: BorderRadius.circular(25)),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Row(
    //                       children: [
    //                         Image.asset(
    //                           "power-yellow.png",
    //                         ),
    //                         const Text(
    //                           "Energía\n40%",
    //                           style: TextStyle(fontSize: 10),
    //                         )
    //                       ],
    //                     ),
    //                     IconButton(
    //                         onPressed: () {},
    //                         icon: const Icon(
    //                           Icons.control_point_sharp,
    //                           color: Colors.grey,
    //                         ))
    //                   ],
    //                 ),
    //                 Image.asset(
    //                   "bike-icons.png",
    //                   width: 90,
    //                 ),
    //                 const Column(
    //                   children: [
    //                     Text(
    //                       "Plaza de San Sabastián",
    //                       style: TextStyle(
    //                           fontWeight: FontWeight.bold, fontSize: 15),
    //                     ),
    //                     Text(
    //                       "A 3km de tu ubicación",
    //                       style: TextStyle(
    //                           fontWeight: FontWeight.normal, fontSize: 13),
    //                     ),
    //                   ],
    //                 ),
    //                 ElevatedButton.icon(
    //                     onPressed: () {},
    //                     icon: const Icon(Icons.arrow_right),
    //                     label: const Text("Solicitar Bicicleta"),
    //                     style: const ButtonStyle(

    //                         // MaterialColor(Colors.red, Colors.red)
    //                         )),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}
