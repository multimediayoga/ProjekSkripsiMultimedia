import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:kelolapps/view/screens/mywork/promotion/model/PaketBundleRepo.dart';
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
  List<PaketBundleModel> listPaketBundle = getPaketBundle();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context,
          pageName: "Produk Paket Toko"),
      body: Container(
        // height: 250,
        // MediaQuery.of(context).size.height * 0.14408866995,
        width: context.width(),
        // padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
        // decoration: boxDecorationWithRoundedCorners(
        //   borderRadius: BorderRadius.circular(10),
        //   boxShadow: defaultBoxShadow(),
        //   backgroundColor: KelolakuGlobalColor.light70,
        // ),

        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listPaketBundle.length,
            itemBuilder: (context, index) {
              return Container(
                width: context.width(),
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 0, top: 16),
                decoration: boxDecorationDefault(
                    borderRadius: radius(1), color: context.cardColor),
                child:
                    PaketBundleCard(paketBundleModel: listPaketBundle[index]),
              );
            }),
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

class PaketBundleCard extends StatefulWidget {
  final PaketBundleModel paketBundleModel;

  const PaketBundleCard({Key? key, required this.paketBundleModel})
      : super(key: key);

  @override
  State<PaketBundleCard> createState() => _PaketBundleCardState();
}

class _PaketBundleCardState extends State<PaketBundleCard> {
  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.height * 0.07266009852;
    return Column(
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: Dimensions.MARGIN_SIZE_GRID_8,
            ),
            Image.asset(
              widget.paketBundleModel.image,
              height: imageSize,
              width: imageSize,
              fit: BoxFit.cover,
              // color: context.iconColor,
            ).cornerRadiusWithClipRRect(4),
            8.width,
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.paketBundleModel.name,
                  style: heading2.copyWith(
                    color: KelolakuGlobalColor.dark,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                4.height,
                Text(
                  "Semua Pembeli",
                  style: textRegular16.copyWith(
                    color: KelolakuGlobalColor.dark40,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ).expand()
          ],
        ),
        16.height,
        Container(
            height: 1,
            width: context.width(),
            color: KelolakuGlobalColor.grayFed.withOpacity(0.3)),
        16.height,
        Container(
          width: double.infinity,
    // color: tomato,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: Dimensions.MARGIN_SIZE_GRID_8 + 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            "Rp ${widget.paketBundleModel.newPrice.toString().formatRupiah()}",
                            style: heading1.copyWith(
                              color: KelolakuGlobalColor.dark60.withOpacity(.8),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          4.height,
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              widget.paketBundleModel.normalPrice.toString().formatRupiah(),
                              style: textRegular16.copyWith(
                                  color: KelolakuGlobalColor.dark40,
                                  decoration: TextDecoration.lineThrough),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        spacing: Dimensions.MARGIN_SIZE_GRID_8,
                        children: [
                          MaterialButton(
                            padding: EdgeInsets.all(8),
                            child: Text("Informasi",
                                style: textSemibold16.copyWith(
                                    color: KelolakuGlobalColor.colorPrimaryExtra)),
                            textColor: KelolakuGlobalColor.colorPrimaryExtra,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              side: BorderSide(
                                  color: KelolakuGlobalColor.colorPrimaryExtra,
                                  width: 1),
                            ),
                            color: context.cardColor,
                            onPressed: () => {},
                          ),
                          MaterialButton(
                            padding: EdgeInsets.all(8),
                            child: Text("Ubah",
                                style: textSemibold16.copyWith(color: white)),
                            textColor: KelolakuGlobalColor.light70,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            color: KelolakuGlobalColor.colorPrimaryExtra,
                            onPressed: () => {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
