import 'package:flutter/material.dart';
import 'package:pedalpal/pages/qr_scann/qrScann.dart';

class RentDetail extends StatelessWidget {
  const RentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("San Sebastián  "),
            Icon(Icons.pedal_bike_outlined),
          ],
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              "bike-img.png",
              width: 400,
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 2,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 2,
                      blurStyle: BlurStyle.normal,
                      // offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("San Sebastian"),
                    Divider(
                      height: 34,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 40,
                              child: Image.asset("power-green.png"),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 9,
                                  spreadRadius: 3,
                                  blurStyle: BlurStyle.normal,
                                  // offset: Offset(0, 3),
                                )
                              ], shape: BoxShape.circle, color: Colors.white),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Energía",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "40%",
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 67, 146, 210),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 40,
                              child: Image.asset("location.png"),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 9,
                                  spreadRadius: 3,
                                  blurStyle: BlurStyle.normal,
                                  // offset: Offset(0, 3),
                                )
                              ], shape: BoxShape.circle, color: Colors.white),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Lugar",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "San Sebastián",
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 67, 146, 210),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 40,
                              child: Image.asset("card.png"),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 9,
                                  spreadRadius: 3,
                                  blurStyle: BlurStyle.normal,
                                  // offset: Offset(0, 3),
                                )
                              ], shape: BoxShape.circle, color: Colors.white),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pago",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "3.4",
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 67, 146, 210),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset("qr-img.png"),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Escanea el QR",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 24),
                          ),
                          Container(
                            width: 320,
                            child: Text(
                              "Para desbloquear este equipo escanea el qr, ubicado en el volante de la misma",
                              style: TextStyle(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ScannQr(),
                                  ));
                            },
                            child: Text("Escanear"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
