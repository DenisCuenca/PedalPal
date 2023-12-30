import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyLineChart extends StatelessWidget {
  const MyLineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LineChart(
          // swapAnimationDuration: const Duration(milliseconds: 250),
          sampleData1),
    );
  }
}

LineTouchData get batTouchData => LineTouchData(
    enabled: true,
    touchTooltipData: LineTouchTooltipData(
      tooltipBgColor: Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      // getTooltipItem: (
      //   BarChartGroupData group,
      //   int groupIndex,
      //   BarChartRodData rod,
      //   int rodIndex,
      // ) {
      //   return BarTooltipItem(rod.toY.round().toString(),
      //       const TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold));
      // }
    ));

LineChartData get sampleData1 => LineChartData(
      // lineBarsData: lineBarsData,
      minX: 0,
      maxX: 14,
      minY: 0,
      maxY: 4,
      // borderData: FlBorderData(
      //   border: const Border(
      //     top: BorderSide.none,
      //     right: BorderSide.none,
      //     left: BorderSide(width: 1),
      //     bottom: BorderSide(width: 1),
      //   ),
      // // ),
      // titlesData: titlesData,
      // borderData: borderData,

      // gridData: gridData,
    );

Widget LeftTitlesWidget(double value, TitleMeta meta) {
  final style = const TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = "1m";
      break;
    case 2:
      text = "2m";
      break;
    case 3:
      text = "3m";
      break;
    case 4:
      text = "4m";
      break;
    case 5:
      text = "5m";
      break;

    default:
      return Container();
  }

  return Text(
    text,
    style: style,
    textAlign: TextAlign.center,
  );
}



// SideTitles 
// FlTitlesData get titlesData => const FlTitlesData(
//       show: true,
//       bottomTitles: AxisTitles(
//         sideTitles: bottomTitles,
//       ),
//       rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
//       topTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: false,
//         ),
//       ),
//       leftTitles: AxisTitles(
//           // sideTitles: SideTitles(showTitles: false),
//           sideTitles: leftTitles()),
//     );

// FlBorderData get borderData => FlBorderData(show: false);
