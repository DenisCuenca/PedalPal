import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  const MyBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    // return BarChart(BarChartData(
    //   barTouchData: batTouchData,
    //   titlesData: titlesDAta,
    //   borderData: borderData,
    //   barGroups: barGroups,
    //   gridData: const FlGridData(show: true),
    //   alignment: BarChartAlignment.spaceAround,
    //   maxY: 20,
    // ));
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tus reguistros"),
              Text(
                "Ver más",
                style: TextStyle(color: Colors.blueAccent),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          AspectRatio(
            aspectRatio: 1,
            child: BarChart(BarChartData(
              barTouchData: batTouchData,
              // borderData: FlBorderData(
              //   border: const Border(
              //     top: BorderSide.none,
              //     right: BorderSide.none,
              //     left: BorderSide(width: 1),
              //     bottom: BorderSide(width: 1),
              //   ),
              // ),
              borderData: borderData,
              groupsSpace: 10,
              barGroups: barGroups,
              alignment: BarChartAlignment.spaceAround,
              gridData: const FlGridData(
                show: false,
              ),

              // maxY: 2,
            )),
          )
        ],
      ),
    );
  }
}

BarTouchData get batTouchData => BarTouchData(
    enabled: true,
    touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(rod.toY.round().toString(),
              const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold));
        }));

Widget getTitles(double value, TitleMeta meta) {
  final style = const TextStyle(
    color: Colors.blueAccent,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = "Ln";
      break;
    case 1:
      text = "Mr";
      break;
    case 2:
      text = "Mc";
      break;
    case 3:
      text = "Jv";
      break;
    case 4:
      text = "Vr";
      break;
    case 5:
      text = "Sb";
      break;
    case 6:
      text = "Dm";
      break;

    default:
      text = "";
      break;
  }

  return SideTitleWidget(
    child: Text(text, style: style),
    axisSide: meta.axisSide,
    space: 2,
  );
}

FlTitlesData get titlesDAta => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
          sideTitles: SideTitles(
        showTitles: true,
        // reservedSize: 30,
        getTitlesWidget: getTitles,
      )),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

FlBorderData get borderData => FlBorderData(show: false);

LinearGradient get _barGradient => const LinearGradient(
      colors: [
        Colors.blueAccent,
        Colors.redAccent,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

List<BarChartGroupData> get barGroups => [
      BarChartGroupData(
          x: 0,
          barRods: [BarChartRodData(toY: 2, color: Colors.black)],
          showingTooltipIndicators: [0]),
      BarChartGroupData(
          x: 1,
          barRods: [BarChartRodData(toY: 2, color: Colors.black)],
          showingTooltipIndicators: [0]),
      BarChartGroupData(x: 2, barRods: [
        BarChartRodData(toY: 2.6, color: Color.fromARGB(255, 36, 96, 149))
      ], showingTooltipIndicators: [
        0
      ]),
      BarChartGroupData(
          x: 3,
          barRods: [BarChartRodData(toY: 1, color: Colors.grey)],
          showingTooltipIndicators: [0]),
      BarChartGroupData(x: 4, barRods: [
        BarChartRodData(toY: 1, color: Color.fromARGB(255, 36, 96, 149))
      ], showingTooltipIndicators: [
        0
      ]),
      BarChartGroupData(
          x: 5,
          barRods: [BarChartRodData(toY: 3, color: Colors.blue)],
          showingTooltipIndicators: [0]),
      BarChartGroupData(x: 6, barRods: [
        BarChartRodData(toY: 1, color: Color.fromARGB(255, 255, 94, 0))
      ], showingTooltipIndicators: [
        0
      ]),
    ];

class BarChartSample extends StatefulWidget {
  const BarChartSample({super.key});

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.6,
      child: MyBarChart(),
    );
  }
}
