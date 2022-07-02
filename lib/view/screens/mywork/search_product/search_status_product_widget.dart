import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:nb_utils/nb_utils.dart';

Widget searchAlbumTextFiled(BuildContext context,
    {required String searchWhat}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.05418719211,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: white),
      alignment: Alignment.center,
      child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            fillColor: KelolakuGlobalColor.lightSmoke,
            hintText: searchWhat,
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            contentPadding:
                EdgeInsets.only(left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
          )),
    ),
  );
}
