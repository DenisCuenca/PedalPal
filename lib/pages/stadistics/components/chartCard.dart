import 'package:flutter/material.dart';
import 'package:pedalpal/pages/stadistics/components/barchart.dart';

class ChartCard extends StatelessWidget {
  const ChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 270,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 3,
              blurStyle: BlurStyle.normal,
              offset: const Offset(0, 3),
            )
          ]),
      child: Container(
        padding: const EdgeInsets.all(17),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.social_distance,
                  color: Colors.grey,
                ),
                Text(
                  "  Distancia recorrida",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            UserBarChart()
          ],
        ),
      ),
    );
  }
}
