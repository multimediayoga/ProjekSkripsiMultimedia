import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/view/screens/mywork/employee/model/EmployeeRepo.dart';
import 'package:nb_utils/nb_utils.dart';


class EmployeeCard extends StatefulWidget {
  final EmployeeModel model;
  const EmployeeCard({Key? key, required this.model}) : super(key: key);

  @override
  _EmployeeCardState createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  late var width;
  late var imageCache;
  bool checkboxThree = false;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;

    Widget editEmployeeButton(){
      return Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            // showConfirmDialogCustom(
            //   context,
            //   title: 'Do you want to logout from the app?',
            //   onAccept: (v) {
            //     finish(context);
            //   },
            // );
          },
          child: Container(
            // alignment: Alignment.center,
            // margin: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
            padding: EdgeInsets.only(left: 4),
            // width: 150,
            // height: 50,
            decoration: BoxDecoration(
              color: KelolakuGlobalColor.dark20,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.0),
                bottomLeft: Radius.circular(24.0),
              ),
              border: Border.all(color: KelolakuGlobalColor.dark20, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit, color: KelolakuGlobalColor.dark, size: 24),
                Padding(
                  padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  child: Text(
                    "Ubah",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: title12.copyWith(color: KelolakuGlobalColor.dark)
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(left: 16, bottom: 16, right: 16),
      decoration: boxDecoration(radius: 10, showShadow: true, bgColor: context.cardColor),
      padding: EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 0),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, color: KelolakuGlobalColor.light70),
                    width: width / 6.5,
                    height: width / 6.5,
                    padding: EdgeInsets.all(10),
                    child: imageCache,
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.model.ownerName, style: heading2.copyWith(color: KelolakuGlobalColor.dark70)),
                      4.height,
                      Text(widget.model.phoneNumber, style: textSemibold16.copyWith(color: KelolakuGlobalColor.dark40)),
                    ],
                  ),
                ],
              ),
              editEmployeeButton()
            ],
          ),
          16.height,
          Text(widget.model.roleStatus.join(", "), style: textRegular16.copyWith(color: KelolakuGlobalColor.dark40)),
          8.height,
          Divider(height: 50),
          4.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dapat Menerima Pesanan',
                style: primaryTextStyle(),
              ),
              IconButton(
                icon: checkboxThree
                    ? Icon(LineIcons.check_square, color: KelolakuGlobalColor.ocean, size: 30)
                    : Icon(Icons.crop_square_sharp, size: 30, color: KelolakuGlobalColor.dark),
                onPressed: () {
                  checkboxThree = !checkboxThree;
                  setState(() {});
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
      init();
  }

  Future<void> init() async {
      imageCache = commonCacheImageWidget(widget.model.ownerProfile, 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(50);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }
}
