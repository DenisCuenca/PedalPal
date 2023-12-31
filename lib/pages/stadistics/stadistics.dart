import 'package:flutter/material.dart';
import 'package:pedalpal/pages/dashboard/components/barChart.dart';
import 'package:pedalpal/pages/stadistics/components/chartCard.dart';
import 'components/lineChart.dart';

class Stadistics extends StatelessWidget {
  const Stadistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Tus Estadisticas  ",
                style: TextStyle(fontSize: 24),
              ),
              Icon(Icons.pedal_bike_rounded)
            ],
          ),
          const SizedBox(
              // height: ,
              ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(5),
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const ChartCard(),
                const ChartCard(),
                const ChartCard(),
                // MyLineChart(),
                // ChartCard(),
                // ChartCard(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
