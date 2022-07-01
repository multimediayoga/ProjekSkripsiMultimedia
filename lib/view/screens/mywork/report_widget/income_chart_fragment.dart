import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:nb_utils/nb_utils.dart';

class IncomeChartScreen extends StatefulWidget {
  static String tag = '/IncomeChartScreen';

  @override
  IncomeChartScreenState createState() => IncomeChartScreenState();
}

class IncomeChartScreenState extends State<IncomeChartScreen> {
  final Color leftBarColor = KelolakuGlobalColor.green;
  final Color rightBarColor = KelolakuGlobalColor.red;
  late final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
      child: BarChart(
        BarChartData(
          maxY: 20,
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
              showTitles: true,
              margin: 20.4,
              getTitles: (double value) {
                switch (value.toInt()) {
                  case 0:
                    return 'Minggu';
                  case 1:
                    return 'Senin';
                  case 2:
                    return 'Selasa';
                  case 3:
                    return 'Rabu';
                  case 4:
                    return 'Kamis';
                  case 5:
                    return 'Jumat';
                  case 6:
                    return 'Sabtu';
                  default:
                    return '';
                }
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              margin: 16.4,
              reservedSize: 14,
              getTitles: (value) {
                if (value == 0) {
                  return '100k';
                } else if (value == 10) {
                  return '20k';
                } else if (value == 19) {
                  return '25k';
                } else if (value == 5) {
                  return '14k';
                } else {
                  return '';
                }
              },
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: showingBarGroups,
        ),
      ).center(),
    ).paddingAll(16).center();
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(y: y1, colors: [leftBarColor], width: width),
        BarChartRodData(y: y2, colors: [rightBarColor], width: width),
      ],
    );
  }
}

