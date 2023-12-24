import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: 200,
                margin: EdgeInsets.only(right: 20, bottom: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 3,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(0, 3),
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
                            Text(
                              "Energía\n40%",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.control_point_sharp,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Image.asset(
                      "bike-icons.png",
                      width: 90,
                    ),
                    Column(
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
                        icon: Icon(Icons.arrow_right),
                        label: Text("Solicitar Bicicleta"),
                        style: ButtonStyle(

                            // MaterialColor(Colors.red, Colors.red)
                            )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: 200,
                margin: EdgeInsets.only(right: 20, bottom: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 3,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(0, 3),
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
                            Text(
                              "Energía\n40%",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.control_point_sharp,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Image.asset(
                      "bike-icons.png",
                      width: 90,
                    ),
                    Column(
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
                        icon: Icon(Icons.arrow_right),
                        label: Text("Solicitar Bicicleta"),
                        style: ButtonStyle(

                            // MaterialColor(Colors.red, Colors.red)
                            )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                width: 200,
                margin: EdgeInsets.only(right: 20, bottom: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 3,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(0, 3),
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
                            Text(
                              "Energía\n40%",
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.control_point_sharp,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Image.asset(
                      "bike-icons.png",
                      width: 90,
                    ),
                    Column(
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
                        icon: Icon(Icons.arrow_right),
                        label: Text("Solicitar Bicicleta"),
                        style: ButtonStyle(

                            // MaterialColor(Colors.red, Colors.red)
                            )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
