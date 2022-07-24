import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/color_style.dart';
import '../../../../route/route_helper.dart';
import '../../../../utils/dimensions.dart';

class PromoPaketBundleScreen extends StatefulWidget {
  const PromoPaketBundleScreen({Key? key}) : super(key: key);

  @override
  State<PromoPaketBundleScreen> createState() => _PromoPaketBundleScreenState();
}

class _PromoPaketBundleScreenState extends State<PromoPaketBundleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context, pageName: "Produk Paket Toko"),
      body:                       Container(
        // height: 250,
        // MediaQuery.of(context).size.height * 0.14408866995,
        width: context.width(),
        padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(10),
          boxShadow: defaultBoxShadow(),
          backgroundColor: KelolakuGlobalColor.light70,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
        padding: EdgeInsets.only(
            left: 16, bottom: Dimensions.BOTTOM_HEIGHT_GRID, right: 16, top: 8),
        child: AppButton(
          text: 'Buat Produk Paket Baru'.toUpperCase(),
          textColor: white,
          color: KelolakuGlobalColor.colorPrimaryExtra,
          onTap: () {
            Get.toNamed(RouteHelper.getStorePaketBundlePage());
          },
        ),
      ),
    );
  }
}
