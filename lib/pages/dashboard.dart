import 'dart:async';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.black12,
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
                      child:
                          Icon(Icons.qr_code_rounded, color: Colors.blue[900]),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const Text(
                      "Utiliza una bicicleta",
                      style:
                          TextStyle(fontSize: 8, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Escanear Qr",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue[900]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
              width: 110,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 239, 239),
                  borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Icon(Icons.cyclone_outlined, color: Colors.orange),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const Text(
                      "Utiliza una bicicleta",
                      style:
                          TextStyle(fontSize: 8, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Escanear Qr",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue[900]),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 120,
              width: 110,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 239, 239, 239),
                  borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child:
                          Icon(Icons.credit_card_rounded, color: Colors.purple),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7)),
                    ),
                    const Text(
                      "Utiliza una bicicleta",
                      style:
                          TextStyle(fontSize: 8, fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "Escanear Qr",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue[900]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
