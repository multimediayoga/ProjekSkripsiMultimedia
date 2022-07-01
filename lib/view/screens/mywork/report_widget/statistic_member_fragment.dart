import 'package:flutter/material.dart';
import 'package:kelolapps/view/screens/mywork/report_widget/widget_statistic.dart';
import 'package:nb_utils/nb_utils.dart';

class WAStatisticsComponent extends StatefulWidget {
  static String tag = '/WAStatisticsComponent';

  @override
  WAStatisticsComponentState createState() => WAStatisticsComponentState();
}

class WAStatisticsComponentState extends State<WAStatisticsComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            waStatisticsWidget(title: "Pendaftar Minggu Ini", amount: "+8", icons: Icons.person_add_alt, color: Color(0xFF6C56F9)),
            16.width,
            waStatisticsWidget(title: "Total Pelanggan", amount: "45", icons: Icons.show_chart, color: Color(0xFFFF7426)),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}

