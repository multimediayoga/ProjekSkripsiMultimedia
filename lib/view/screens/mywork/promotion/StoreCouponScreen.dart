import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/router/route_helper.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/image.dart';
import '../../../../helper/reusable_widget.dart';
import '../../../../utils/AppWidget.dart';
import 'model/CouponsRepo.dart';

class StoreCouponScreen extends StatefulWidget {
  const StoreCouponScreen({Key? key}) : super(key: key);

  @override
  State<StoreCouponScreen> createState() => _StoreCouponScreenState();
}

class _StoreCouponScreenState extends State<StoreCouponScreen> {
  List<CouponModel> orderList = getCouponData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context,
          pageName: "Promosi Kupon"),
      body: SafeArea(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: orderList.length,
            itemBuilder: (context, index) {
              return CardCouponCrud(
                  index: index, couponModel: orderList[index]);
              // return Container();
            }),
      ),
      bottomNavigationBar: Container(
        decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
        padding: EdgeInsets.only(
            left: 16, bottom: Dimensions.BOTTOM_HEIGHT_GRID, right: 16, top: 8),
        child: AppButton(
          text: 'Buat Kupon Baru'.toUpperCase(),
          textColor: white,
          color: KelolakuGlobalColor.colorPrimaryExtra,
          onTap: () {
            Get.toNamed(RouteHelper.getCreateStoreCouponPage());
          },
        ),
      ),
    );
  }
}

class CardCouponCrud extends StatelessWidget {
  final int index;
  final CouponModel couponModel;

  const CardCouponCrud(
      {Key? key, required this.index, required this.couponModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cardwidth = MediaQuery.of(context).size.width;
    return Container(
      width: cardwidth,
      decoration: BoxDecoration(
        color: context.cardColor,
      ),
      margin: EdgeInsets.only(bottom: 32),
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.MARGIN_SIZE_GRID_8, vertical: 8),
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: KelolakuGlobalColor.dark70.withOpacity(0.04),
                  offset: Offset(0, 15),
                  blurRadius: 16.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            width: cardwidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    commonCacheImageWidget(
                            KelolaImage.couponsIcon.validate(), 56,
                            fit: BoxFit.cover, width: 56)
                        .cornerRadiusWithClipRRect(6),
                    8.width,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          couponModel.codeCoupon.toUpperCase(),
                          style:
                              title20.copyWith(color: KelolakuGlobalColor.dark),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            couponModel.memberName,
                            style: textSemibold20.copyWith(
                                color: KelolakuGlobalColor.dark30),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit,
                              color: KelolakuGlobalColor.green40),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete,
                                color: KelolakuGlobalColor.red40)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.height,
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Potongan Harga: Rp ${couponModel.discountPrice?.toString().formatRupiah()}", style: textSemibold20.copyWith(
                  color: KelolakuGlobalColor.orange
                ),),
                4.height,
                Row(
                  children: [
                    Image.asset(
                      KelolaImage.rpIcon,
                      height: 16,
                      width: 14,
                      fit: BoxFit.cover,
                      // color: context.iconColor,
                    ),
                    4.width,
                    Text("Belanja minimal Rp ${couponModel.minimumPrice?.toString().formatRupiah()}", style: textSemibold14.copyWith(
                    color: KelolakuGlobalColor.dark40,),),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
