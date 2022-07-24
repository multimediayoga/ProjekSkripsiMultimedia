import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/button/button.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text_field/text_field.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../helper/reusable_widget.dart';
import '../../../../utils/AppWidget.dart';
import '../../../../utils/fluk/text_fluk.dart';
import 'model/MemberRepo.dart';

class CreateCouponScreen extends StatefulWidget {
  const CreateCouponScreen({Key? key}) : super(key: key);

  @override
  State<CreateCouponScreen> createState() => _CreateCouponScreenState();
}

class _CreateCouponScreenState extends State<CreateCouponScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  TextEditingController couponCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  String getUpdatedMemberName = "";
  int? _selectedMember;
  int iteration = -1;
  List<MembershipModel> membershipList = getMembership();

  FocusNode couponFocus = FocusNode();
  FocusNode cityFocus = FocusNode();
  String? randomCoupon;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
    _selectedMember = 0;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void ShowChooseMembershipWidget(BuildContext context, List<MembershipModel> memberlist) async{
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              shrinkWrap: true,
              itemCount: membershipList.length,
              itemBuilder: (_, index) {
                iteration++;
                return InkWell(
                  onTap: (){
                    _selectedMember = index;
                    getUpdatedMemberName = membershipList[index].membershipName;
                    setState(() { });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Radio(
                          onChanged: (dynamic value) {
                            setState(() {
                              _selectedMember = index;
                              getUpdatedMemberName = membershipList[index].membershipName;
                            });
                          },
                          groupValue: _selectedMember,
                          value: iteration == 0 ? iteration : index,
                          visualDensity: VisualDensity.compact,
                          activeColor: KelolakuGlobalColor.colorPrimaryExtra,
                        ),
                        8.width,
                        Text(membershipList[index].membershipName, style: textSemibold16.copyWith(color: KelolakuGlobalColor.dark),)
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration jsInputDecoration(
        {Icon? icon,
        String? hintText,
        Icon? prefixIcon,
        bool? showPreFixIcon}) {
      return InputDecoration(
          // labelText: randomCoupon ?? randomCoupon,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: white),
          ),
          hintText: hintText,
          hintStyle: secondaryTextStyle(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          filled: true,
          fillColor: white,
          suffixIcon: icon.validate(),
          prefixIcon: showPreFixIcon.validate() ? prefixIcon.validate() : null);
    }

    return Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context,
          pageName: "Buat Kupon Baru"),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.MARGIN_SIZE_GRID_6, vertical: 32),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Kode Kupon",
                      style:
                          heading2.copyWith(color: KelolakuGlobalColor.dark60),
                    ),
                    8.height,
                    Container(
                      height: 48,
                      decoration: boxDecoration(
                        radius: 8,
                        color: KelolakuGlobalColor.dark10,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 8,
                            child: AppTextField(
                              controller: couponCodeController,
                              focus: couponFocus,
                              autoFillHints: [AutofillHints.creditCardSecurityCode],
                              nextFocus: cityFocus,
                              textFieldType: TextFieldType.OTHER,
                              keyboardType: TextInputType.text,
                              decoration: jsInputDecoration(
                                  hintText: "Kode Kupon, tanpa spasi",
                                  showPreFixIcon: false),
                            ),
                          ),
                          Flexible(
                              flex: 1,
                              child: Container(
                                height: 48,
                                padding: EdgeInsets.all(2),
                                decoration: boxDecoration(
                                    radius: 8,
                                    color: KelolakuGlobalColor.orange,
                                    bgColor: KelolakuGlobalColor.orange),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      MdiIcons.repeat,
                                      color: white,
                                    ),
                                    // Text('Acak Kode', style: textRegular12.copyWith(color: white)),
                                  ],
                                ),
                              ).onTap(() {
                                randomCoupon = "HVPNT75ND";
                                couponCodeController.text = randomCoupon!;
                                setState(() {});
                              }))
                        ],
                      ),
                    ),
                  ],
                ),
                32.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Pilih Target Promo",
                      style:
                      heading3.copyWith(color: KelolakuGlobalColor.dark),
                    ),
                    8.height,
                    InkWell(
                      onTap: (){
                        ShowChooseMembershipWidget(context, membershipList);
                      },
                      child: Container(
                        decoration: boxDecorationWithRoundedCorners(
                          border: Border.all(color: gray.withOpacity(0.3)),
                          backgroundColor: white,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(!(getUpdatedMemberName.isEmptyOrNull) ? getUpdatedMemberName : "Semua Pembeli", style: textRegular16.copyWith(color: KelolakuGlobalColor.dark40)),
                              ],
                            ),
                            Icon(Icons.arrow_drop_down, color: KelolakuGlobalColor.dark40),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                32.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Masukkan Belanjan Minimum",
                        style:
                        heading3.copyWith(color: KelolakuGlobalColor.dark),
                      ),
                    ),
                    8.height,
                    FxContainer(
                      color: white,
                      padding: FxSpacing.all(8),
                      child: Row(
                        children: [
                          FxContainer.none(
                            paddingAll: 8,
                            color: KelolakuGlobalColor.colorPrimaryExtra,
                            borderRadiusAll: 4,
                            child: Text(
                              "Rp",
                              style: heading3.copyWith(color: white),
                            ),
                          ),
                          8.width,
                          Expanded(
                            child: FxTextField(
                              hintText: "0",
                              hintStyle: FxTextStyle.bodyMedium(),
                              labelStyle: FxTextStyle.bodyMedium(),
                              style: FxTextStyle.bodyMedium(),
                              labelText: "0",
                              isDense: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              contentPadding: FxSpacing.right(16),
                              focusedBorderColor: Colors.transparent,
                              cursorColor: KelolakuGlobalColor.colorPrimaryExtra,
                              // prefixText: "Rp ",
                              textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          // 8.width,
                          // FxButton.medium(
                          //   onPressed: () {
                          //     // Navigator.push(
                          //     //     context,
                          //     //     MaterialPageRoute(
                          //     //         builder: (context) => GroceryCouponScreen()));
                          //   },
                          //   child: FxText.labelMedium("Diskon 0%",
                          //       letterSpacing: 0.5,
                          //       fontWeight: 600,
                          //       color: white),
                          //   backgroundColor: KelolakuGlobalColor.orange,
                          //   borderRadiusAll: 4,
                          //   padding: FxSpacing.xy(32, 12),
                          //   elevation: 0,
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                32.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Masukkan Potongan Harga",
                        style:
                        heading3.copyWith(color: KelolakuGlobalColor.dark),
                      ),
                    ),
                    8.height,
                    FxContainer(
                      color: white,
                      padding: FxSpacing.all(8),
                      child: Row(
                        children: [
                          FxContainer.none(
                            paddingAll: 8,
                            color: KelolakuGlobalColor.colorPrimaryExtra,
                            borderRadiusAll: 4,
                            child: Text(
                              "Rp",
                              style: heading3.copyWith(color: white),
                            ),
                          ),
                          8.width,
                          Expanded(
                            child: FxTextField(
                              hintText: "0",
                              hintStyle: FxTextStyle.bodyMedium(),
                              labelStyle: FxTextStyle.bodyMedium(),
                              style: FxTextStyle.bodyMedium(),
                              labelText: "0",
                              isDense: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                              contentPadding: FxSpacing.right(16),
                              focusedBorderColor: Colors.transparent,
                              cursorColor: KelolakuGlobalColor.colorPrimaryExtra,
                              // prefixText: "Rp ",
                              textCapitalization: TextCapitalization.sentences,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          8.width,
                          FxButton.medium(
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => GroceryCouponScreen()));
                            },
                            child: FxText.labelMedium("Diskon 0%",
                                letterSpacing: 0.5,
                                fontWeight: 600,
                                color: white),
                            backgroundColor: KelolakuGlobalColor.orange,
                            borderRadiusAll: 4,
                            padding: FxSpacing.xy(32, 12),
                            elevation: 0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                64.height,
                AppButton(
                  onTap: () {
                    Get.back();
                  },
                  width: context.width(),
                  margin: EdgeInsets.all(16),
                  color: KelolakuGlobalColor.colorPrimaryExtra,
                  child: Text("Buat Kupon", style: boldTextStyle(color: white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//Used for Bottom Sheet Membership

