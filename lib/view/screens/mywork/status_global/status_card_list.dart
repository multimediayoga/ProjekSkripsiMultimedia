import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/view/screens/mywork/status_global/status_repo.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/constant.dart';
import '../search_product/SearchStatusProductScreen.dart';
import '../search_product/search_status_product_widget.dart';

class StatusReportCardList extends StatefulWidget {
  const StatusReportCardList({Key? key}) : super(key: key);

  @override
  _StatusReportCardListState createState() => _StatusReportCardListState();
}

class _StatusReportCardListState extends State<StatusReportCardList> {
  TextEditingController controller = TextEditingController();
  List<T12Service> searchDataList = [];

  @override
  void initState() {
    super.initState();
    searchDataList.addAll(getSearchList());
  }


  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var searchList = ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: spacing_standard_new,
            right: spacing_standard_new,
            top: spacing_standard_new),
        itemCount: searchDataList.length,
        itemBuilder: (BuildContext contxt, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: spacing_standard),
            padding: EdgeInsets.all(4),
            decoration: boxDecoration(
                bgColor: KelolakuGlobalColor.light70, showShadow: true),
            child: Row(
              children: <Widget>[
                Image.asset(
                    searchDataList[index].img,
                    width: 24,
                    height: 24,
                    color: KelolakuGlobalColor.dark
                  // t12_colors[index % t12_colors.length],
                ).paddingRight(spacing_standard_new),
                Expanded(
                  child: text(searchDataList[index].serviceName,
                      fontSize: textSizeMedium,
                      textColor: KelolakuGlobalColor.dark),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 20,
                  color: KelolakuGlobalColor.dark,
                )
              ],
            ).paddingAll(spacing_middle),
          ).onTap(() {
            index == 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => SearchStatusProductScreen(getProductStatusWhat: 'Habis',))):
                index == 1 ? Navigator.push(context, MaterialPageRoute(builder: (context) => SearchStatusProductScreen(getProductStatusWhat: "Disembunyikan",))) :
                null;
          });
        });

    return Container(
      child: searchList,
    );
  }
}
