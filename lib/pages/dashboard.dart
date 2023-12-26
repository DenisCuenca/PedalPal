import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pedalpal/pages/dashboard/components/barChart.dart';
import 'package:pedalpal/pages/payment/paymentConf.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static final LatLng _pGooglePlex = const LatLng(-3.9996913, -79.2095082);
  static final LatLng _pdestination = const LatLng(-3.997467, -79.2065033);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
        child: Column(children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.black12,
            ),
            // child: MapboxMap(
            //   initialCameraPosition:
            //       CameraPosition(target: _pGooglePlex, zoom: 15),

            // ),

            child: Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 25, 163, 176),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_activity,
                              color: Colors.white,
                            ),
                            Text(
                              "Lugar",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "4.5km",
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                    ),
                    Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 25, 163, 176),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_activity,
                              color: Colors.white,
                            ),
                            Text(
                              "Lugar",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "4.10km",
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                    ),
                    Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 25, 163, 176),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.local_activity,
                              color: Colors.white,
                            ),
                            Text(
                              "Lugar",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "4.5km",
                              style: TextStyle(color: Colors.white),
                            ),
                          ]),
                    ),
                  ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 120,
                width: 110,
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
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "history");
                },
                child: Ink(
                  height: 120,
                  width: 110,
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
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentConf(),
                      ));
                },
                child: Ink(
                  height: 120,
                  width: 110,
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
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          MyBarChart()
        ]),
      ),
    );
  }
}
