import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutx/themes/text_style.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/container/container.dart';
import 'package:flutx/widgets/text_field/text_field.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:kelolapps/view/screens/mywork/promotion/widget/choose_membership_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/text_style.dart';
import '../../../../helper/reusable_widget.dart';
import 'model/MemberRepo.dart';
import 'model/PaketBundleRepo.dart';

class CreatePaketBundle extends StatefulWidget {
  const CreatePaketBundle({Key? key}) : super(key: key);

  @override
  State<CreatePaketBundle> createState() => _CreatePaketBundleState();
}

class _CreatePaketBundleState extends State<CreatePaketBundle> {
  late File imageFile;
  bool loadFromFile = false;
  String getUpdatedMemberName = "";
  int? _selectedMember;
  int iteration = -1;
  List<MembershipModel> membershipList = getMembership();
  List<PaketBundleModel> listPaketBundle = getPaketBundle();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    setState(
      () {
        if (image != null) {
          imageFile = File(image.path);
          loadFromFile = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthMax = MediaQuery.of(context).size.width;
    var heightMax = MediaQuery.of(context).size.height;
    var heightBigImage = MediaQuery.of(context).size.height * 0.4027093596;
    var widthBigImage = MediaQuery.of(context).size.width * 0.872;

    var uploadPaketContainer = InkWell(
      onTap: () {
        getImage(ImageSource.gallery);
      },
      child: Container(
          width: widthMax,
          height: heightBigImage,
          // color: KelolakuGlobalColor.grayFed.withOpacity(.8),
          child: Stack(
            alignment: Alignment.bottomLeft,
            // fit: StackFit.loose,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: loadFromFile
                      ? Image.file(imageFile,
                              fit: BoxFit.cover,
                              width: widthMax,
                              height: heightBigImage)
                          .cornerRadiusWithClipRRect(50)
                      : Container(
                          color: KelolakuGlobalColor.grayFed.withOpacity(.8),
                        )),
              Positioned(
                bottom: heightBigImage * 0.5 - 54,
                left: context.width() * 0.5 - 54,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      size: context.width() * 0.06157635467 + 50,
                      color: KelolakuGlobalColor.light70.withOpacity(.75),
                    ),
                    4.height,
                    Text(
                      "Unggah",
                      style: heading3.copyWith(color: white),
                    ),
                  ],
                ),
              )
            ],
          )),
    );

    var descriptionPaketBundle = TextFormField(
      maxLines: 8,
      keyboardType: TextInputType.multiline,
      textAlign: TextAlign.left,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        filled: true,
        fillColor: white,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: KelolakuGlobalColor.grayText)),
        hintText: 'Tambahkan Informasi Seperti Dekripsi atau '
            '\n Syarat  Mendapatkan Paket Produk',
        hintStyle: textSemibold16,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context,
          pageName: "Buat Paket Bundle Baru"),
      body: SingleChildScrollView(
        child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_8),
          child: Column(
            children: [
              16.height,
              uploadPaketContainer,
              32.height,
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Nama Paket",
                      style: heading2.copyWith(color: KelolakuGlobalColor.dark),
                    ),
                    8.height,
                    TextFormField(
                      maxLines: 4,
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            left: 16, right: 16, top: 8, bottom: 8),
                        filled: true,
                        fillColor: white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: KelolakuGlobalColor.grayText)),
                        hintText: 'Beri nama paket yang menarik',
                        hintStyle: textSemibold16,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              32.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Pilih Target Promo",
                    style: heading3.copyWith(color: KelolakuGlobalColor.dark),
                  ),
                  8.height,
                  InkWell(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseMembershipWidget(selectedMember: 1,)));
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext buildContext) {
                            return ChooseMembershipWidget(
                              selectedMember: 1,
                            );
                          });
                      setState(() {
                        _selectedMember = 1;
                        getUpdatedMemberName =
                            membershipList[_selectedMember!].membershipName;
                      });
                    },
                    child: Container(
                      decoration: boxDecorationWithRoundedCorners(
                        border: Border.all(color: gray.withOpacity(0.3)),
                        backgroundColor: white,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  !(getUpdatedMemberName.isEmptyOrNull)
                                      ? getUpdatedMemberName
                                      : "Semua Pembeli",
                                  style: textRegular16.copyWith(
                                      color: KelolakuGlobalColor.dark40)),
                            ],
                          ),
                          Icon(Icons.arrow_drop_down,
                              color: KelolakuGlobalColor.dark40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              32.height,
              descriptionPaketBundle,
              32.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Produk dalam Paket",
                      style:
                          heading3.copyWith(color: KelolakuGlobalColor.dark60)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.add,
                        color: KelolakuGlobalColor.green,
                      ),
                      4.width,
                      Text('Tambah',
                          style: heading3.copyWith(
                              color: KelolakuGlobalColor.green)),
                    ],
                  ),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listPaketBundle[0].productInsideBundle?.length,
                itemBuilder: (_, index) {
                  return Container(
                    width: context.width(),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(bottom: 0, top: 4),
                    decoration: boxDecorationDefault(
                        borderRadius: radius(8), color: context.cardColor),
                    child: ProductInsideCard(
                        productPromoModel:
                            listPaketBundle[0].productInsideBundle![index]),
                  );
                },
              ),
              Container(
                child: Row(
                  children: [],
                ),
              ),
              16.height,
              Container(
                width: context.width(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Harga",
                      style:
                          heading2.copyWith(color: KelolakuGlobalColor.dark60),
                    ),
                    Text(
                      "Rp ${200000.toString().formatRupiah()}",
                      style:
                          heading2.copyWith(color: KelolakuGlobalColor.dark70),
                    ),
                  ],
                ),
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
                      "Masukkan Harga Promo Produk Bundle",
                      style: heading3.copyWith(color: KelolakuGlobalColor.dark),
                    ),
                  ),
                  8.height,
                  FxContainer(
                    color: white,
                    padding: FxSpacing.all(16),
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
                child: Text("Buat Paket Bundle", style: boldTextStyle(color: white)),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ProductInsideCard extends StatefulWidget {
  final ProductPromoModel productPromoModel;

  const ProductInsideCard({Key? key, required this.productPromoModel})
      : super(key: key);

  @override
  State<ProductInsideCard> createState() => _ProductInsideCardState();
}

class _ProductInsideCardState extends State<ProductInsideCard> {
  @override
  Widget build(BuildContext context) {
    var imageSize = MediaQuery.of(context).size.height * 0.07266009852;

    Future buildDeleteDialog(
        BuildContext context, ProductPromoModel dataModel, int index) {
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            buttonPadding: EdgeInsets.all(8),
            contentPadding: EdgeInsets.fromLTRB(25, 16, 32, 8),
            insetPadding: EdgeInsets.all(16),
            title: Text(dataModel.name, style: boldTextStyle(size: 24)),
            content: Text("Hapus produk dari paket bundle?"),
            actions: [
              TextButton(
                child: Text("Cancel",
                    style: boldTextStyle(
                        size: 16, color: KelolakuGlobalColor.dark)),
                onPressed: () {
                  finish(context, false);
                },
              ),
              TextButton(
                child: Text("Delete",
                    style: boldTextStyle(
                        size: 16, color: KelolakuGlobalColor.red40)),
                onPressed: () {
                  finish(context, true);
                },
              ),
            ],
          );
        },
      );
    }

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  widget.productPromoModel.image,
                  height: imageSize,
                  width: imageSize,
                  fit: BoxFit.cover,
                  // color: context.iconColor,
                ).cornerRadiusWithClipRRect(8),
                8.width,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productPromoModel.name,
                      style: heading3.copyWith(
                        color: KelolakuGlobalColor.dark60,
                      ),
                    ),
                    16.height,
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Variasi ${widget.productPromoModel.variant} (2)",
                          style: textRegular16.copyWith(
                              color: KelolakuGlobalColor.dark30),
                        ))
                  ],
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.restore_from_trash_outlined),
              onPressed: () {
                buildDeleteDialog(context, widget.productPromoModel, 0);
              },
              color: KelolakuGlobalColor.red,
            ),
          ],
        ),

      ],
    );
  }
}
