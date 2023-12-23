import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          height: 280,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                width: 200,
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 218, 218),
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
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 218, 218),
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
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 218, 218),
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
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 218, 218),
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
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 218, 218, 218),
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
            ],
          ),
        ),
      ],
    );
  }
}
