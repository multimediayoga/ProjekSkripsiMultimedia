import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelolapps/view/screens/mywork/search_product/search_status_product_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/color_style.dart';
import '../../../../config/kelolaku/text_style.dart';
import '../report_widget/report/product_min_report_model.dart';

class SearchStatusProductScreen extends StatefulWidget {
  final String getProductStatusWhat;
  const SearchStatusProductScreen({Key? key, required this.getProductStatusWhat}) : super(key: key);

  @override
  State<SearchStatusProductScreen> createState() => _SearchStatusProductScreenState();
}

class _SearchStatusProductScreenState extends State<SearchStatusProductScreen> {
  List<SneakerShoppingModel> data = SneakerRepo().getAllFavorite();
  bool checked = false;
  int? newNotification = 3;
  Color customColor = KelolakuGlobalColor.green;
  bool valuefirst = false;
  bool valuesecond = false;
  bool isSwitched = false;
  var textHolder;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
    textHolder = widget.getProductStatusWhat;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget listStatusWidget(){
    return SingleChildScrollView(
      child: Column(
        children: data.map(
              (e) {
            return Container(
              margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
              padding: EdgeInsets.all(16.0),
              decoration: boxDecorationRoundedWithShadow(
                8,
                backgroundColor: white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: Colors.grey.shade50,
                      borderRadius: radius(8),
                    ),
                    child: Image.asset((e.img).validate(), fit: BoxFit.fill),
                  ),
                  8.width,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.name!, style: title14.copyWith(
                        color: KelolakuGlobalColor.dark
                      ),),
                      SizedBox(height: 4,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Status $textHolder", style: textRegular14.copyWith(
                            color: isSwitched ? KelolakuGlobalColor.ocean : KelolakuGlobalColor.dark
                          ),),
                          Transform.scale(
                            scale: 1.2,
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  textHolder == "Habis" ? textHolder = "Tersedia" : textHolder == "Disembunyikan" ? textHolder = "Ditampilkan" : textHolder = widget.getProductStatusWhat;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: KelolakuGlobalColor.ocean,
                              activeColor: KelolakuGlobalColor.ocean,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).expand(),
                ],
              ),
            );
          },
        ).toList(),
      ).paddingOnly(right: 16.0, left: 16.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: KelolakuGlobalColor.light70,
          title: Text(widget.getProductStatusWhat,
              style: title20.copyWith(color: KelolakuGlobalColor.dark)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,
                color: KelolakuGlobalColor.dark, size: 20),
          ),
        ),
        body: SafeArea(child: Container(child: Column(
      children: [
        searchAlbumTextFiled(context, searchWhat: "Cari Produk ${textHolder}"),
        16.height,
        listStatusWidget()
      ],
    ),)));
  }
}
