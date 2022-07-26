import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreSettingScreen extends StatefulWidget {
  const StoreSettingScreen({Key? key}) : super(key: key);

  @override
  State<StoreSettingScreen> createState() => _StoreSettingScreenState();
}

class _StoreSettingScreenState extends State<StoreSettingScreen> {
  var selectedColor = -1;

  void init() async {
    //

  }

  @override
  void initState() {
    super.initState();
    init();
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {

    const sh_cat_1 = Color(0xFFFA4352);
    const sh_cat_2 = Color(0xFF34B5C8);
    const sh_cat_3 = Color(0xFFFED76D);
    const sh_cat_4 = Color(0xFF0C5A93);
    const sh_cat_5 = Color(0xFF3CA69B);

    const dd1 = "#FA4352";
    const dd2 = "#FED76D";
    const dd3 = "#3CA69B";
    const dd4 = "#0C5A93";
    // var colorList = [sh_cat_1, sh_cat_2, sh_cat_3, sh_cat_4, sh_cat_5];
    var colorList = [dd1, dd2, dd3, dd4];

    var colors = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colorList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectedColor = index;
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: KelolakuGlobalColor.light70, width: 0.5), color: getColorFromHex(colorList[index])),
            child: selectedColor == index ? Icon(Icons.done, color: white, size: 15) : Container(width: 11, height: 11,),
          ),
        );
      },
    );

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: KelolakuGlobalColor.light70,
          title: Text("Pengaturan Toko",
              style: heading3.copyWith(color: KelolakuGlobalColor.dark)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,
                color: KelolakuGlobalColor.dark, size: 20),
          ),
        ),
        body: SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_8),
              child: Column(
                children: [
                  16.height,
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Pengaturan Toko Maju Makmur",
                      style: heading2.copyWith(color: KelolakuGlobalColor.dark60),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  16.height,
                  Container(
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: KelolakuGlobalColor.deepBlue30,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Pilih Tema Toko Online",
                              style: heading3.copyWith(color: KelolakuGlobalColor.dark60),
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          8.height,
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Jadikan Toko Online Anda Berbeda dari yang lain dan sesuaikan dengan brand toko!",
                              style: textRegular14.copyWith(color: KelolakuGlobalColor.dark60),
                              maxLines: 3,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          8.height,
                          Container(
                              height: 75,
                              // color: tomato,
                              width: MediaQuery.of(context).size.width,
                              child: colors
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
