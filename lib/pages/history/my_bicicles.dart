import 'package:flutter/material.dart';
import 'package:pedalpal/pages/bikeDetail/bikeDetail.dart';

class MyBikes extends StatelessWidget {
  const MyBikes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Text("Historial de bicicletas  "),
            Icon(Icons.pedal_bike_rounded),
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: ListView(
            children: [
              const Text(
                "Bicicletas que haz usado:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: const Color.fromARGB(255, 236, 236, 236),
                  ),
                  height: 65,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.pedal_bike_sharp),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "San Sebastián",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("3/04/2023     --   45min"),
                                ],
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BikeDetail()));
                          },
                          child: Ink(child: Icon(Icons.more_horiz)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
