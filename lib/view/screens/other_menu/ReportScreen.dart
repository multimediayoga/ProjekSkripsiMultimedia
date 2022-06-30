import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../fragments/report_widget/income_chart_screen.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  double? width_widget;

  final Color leftBarColor = KelolakuGlobalColor.green;
  final Color rightBarColor = KelolakuGlobalColor.red;
  late final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  Future<void> init() async {}

  @override
  Widget build(BuildContext context) {
    width_widget = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: KelolakuGlobalColor.light70,
          title: Text("Laporan Toko",
              style: title20.copyWith(color: KelolakuGlobalColor.dark)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,
                color: KelolakuGlobalColor.dark, size: 20),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // height: kToolbarHeight,
                width: width_widget,
                height: kToolbarHeight,
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.MARGIN_SIZE_GRID_8),
                decoration: BoxDecoration(
                  color: KelolakuGlobalColor.light70,
                  boxShadow: [
                    BoxShadow(
                        color: KelolakuGlobalColor.grayFed.withOpacity(0.3),
                        offset: Offset(0.0, 1.0),
                        blurRadius: 2.0)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kas Toko",
                      style: heading1,
                    ),
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Minggu Ini ',
                              style: heading2.copyWith(
                                  color: KelolakuGlobalColor.dark40)),
                          WidgetSpan(
                              child: Icon(
                            Icons.calendar_today,
                            color: KelolakuGlobalColor.dark40,
                          )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              32.height,
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.MARGIN_SIZE_GRID_8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Pemasukan (Hijau)',
                              style: textSemibold12.copyWith(
                                  color: KelolakuGlobalColor.green)),
                          const WidgetSpan(
                              child: Icon(
                            Icons.add_chart,
                                size: 15,
                            color: KelolakuGlobalColor.green,
                          )),
                        ],
                      ),
                    ),

                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Pengeluaran (Merah)',
                              style: textSemibold12.copyWith(
                                  color: KelolakuGlobalColor.red)),
                          const WidgetSpan(
                              child: Icon(
                                size: 15,
                                Icons.stacked_bar_chart,
                                color: KelolakuGlobalColor.red,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IncomeChartScreen(),
              Text(
                'Pendapatan Bulan ini Rp ${300000.toDouble().toString().formatRupiah()}',
                style: title20.copyWith(color: KelolakuGlobalColor.colorPrimaryExtra),
              ),
              32.height,
              Container(
                width: width_widget,
                padding: EdgeInsets.all(Dimensions.MARGIN_SIZE_GRID_8),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Produk Terlaris",
                        style: heading2.copyWith(color: KelolakuGlobalColor.dark60),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
