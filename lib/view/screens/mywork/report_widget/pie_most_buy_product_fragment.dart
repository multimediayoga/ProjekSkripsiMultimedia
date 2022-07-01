import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/view/screens/mywork/report_widget/pie_sample.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class PieMostPopularProduct extends StatefulWidget {
  PieMostPopularProduct({Key? key}) : super(key: key);

  @override
  _PieMostPopularProductState createState() => _PieMostPopularProductState();
}

class _PieMostPopularProductState extends State<PieMostPopularProduct> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(height: 400, child: _buildDefaultPieChart()));
  }

  SfCircularChart _buildDefaultPieChart() {
    return SfCircularChart(
      enableMultiSelection: true,
      title: ChartTitle(
          text: '', textStyle: title20.copyWith(color: KelolakuGlobalColor.dark)),
      legend: Legend(isVisible: true, position: LegendPosition.bottom),
      series: _getDefaultPieSeries(),
    );
  }

  List<PieSeries<ChartSampleData, String>> _getDefaultPieSeries() {
    final List<ChartSampleData> pieData = <ChartSampleData>[
      ChartSampleData(x: 'Mad Western', y: 13, text: '13 Unit'),
      ChartSampleData(x: 'Holy Grail', y: 24, text: '24 Unit'),
      ChartSampleData(x: 'Meal Kid', y: 25, text: '25 Unit'),
      ChartSampleData(x: 'Every', y: 38, text: '38 Unit'),
    ];
    return <PieSeries<ChartSampleData, String>>[
      PieSeries<ChartSampleData, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '25',
          dataSource: pieData,
          xValueMapper: (ChartSampleData data, _) => data.x as String,
          yValueMapper: (ChartSampleData data, _) => data.y,
          dataLabelMapper: (ChartSampleData data, _) => data.text,
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }
}
