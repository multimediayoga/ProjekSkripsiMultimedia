import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:kelolapps/view/screens/mywork/promotion/widget/choose_membership_widget.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/text_style.dart';
import '../../../../helper/reusable_widget.dart';
import 'model/MemberRepo.dart';

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
      onTap: (){
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
                  child: loadFromFile ? Image.file(imageFile, fit: BoxFit.cover, width: widthMax, height: heightBigImage).cornerRadiusWithClipRRect(50) : Container(
                    color: KelolakuGlobalColor.grayFed.withOpacity(.8),
                  )
              ),
              Positioned(
                bottom: heightBigImage * 0.5  - 54,
                left: context.width() * 0.5 - 54,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt_outlined, size: context.width() * 0.06157635467 + 50, color: KelolakuGlobalColor.light70.withOpacity(.75),),
                    4.height,
                    Text("Unggah", style: heading3.copyWith(
                        color: white
                    ),),
                  ],
                ),
              )
            ],
          )
      ),
    );

    return SafeArea(child: Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context,
          pageName: "Buat Paket Bundle Baru"),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_8),
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
                      "Nama Paket", style: heading2.copyWith(color: KelolakuGlobalColor.dark),
                    ),
                    8.height,
                    TextFormField(
                      maxLines:4,
                      keyboardType: TextInputType.multiline,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                        filled: true,
                        fillColor: white,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: KelolakuGlobalColor.grayText)),
                        hintText: 'Beri nama paket yang menarik',
                        hintStyle: textSemibold16,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), ),
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
                    style:
                    heading3.copyWith(color: KelolakuGlobalColor.dark),
                  ),
                  8.height,
                  InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseMembershipWidget(selectedMember: 1,)));
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext buildContext) {
                            return ChooseMembershipWidget(selectedMember: 1,);
                          });
                      setState(() {_selectedMember = 1; getUpdatedMemberName = membershipList[_selectedMember!].membershipName; });
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
            ],
          ),
        ),
      ),
    ));
  }
}
