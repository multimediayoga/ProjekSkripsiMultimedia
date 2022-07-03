import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:nb_utils/nb_utils.dart';

class BMSocialInputWidget extends StatefulWidget {
  final String socialMedia;
  final IconData socialIcon;


  const BMSocialInputWidget({Key? key, required this.socialMedia, required this.socialIcon}) : super(key: key);

  @override
  State<BMSocialInputWidget> createState() => _BMSocialInputWidgetState();
}

class _BMSocialInputWidgetState extends State<BMSocialInputWidget> {
  TextEditingController searchCont = TextEditingController();

  String searchText = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.height,
        Row(
          children: [
            Icon(widget.socialIcon, color: KelolakuGlobalColor.dark60),
            8.width,
            Text('${widget.socialMedia}', style: heading3.copyWith(color: KelolakuGlobalColor.dark60)),
          ],
        ),
        8.height,
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(color: Colors.transparent, borderRadius: radius(0)),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: AppTextField(
                controller: searchCont,
                onChanged: (text){
                  searchText =  text;
                  setState(() {});
                },
                decoration: InputDecoration(
                  fillColor: KelolakuGlobalColor.grayFed,
                  hoverColor: KelolakuGlobalColor.ocean,
                  focusColor: Colors.transparent,
                  filled: false,
                  border: UnderlineInputBorder(borderSide: BorderSide(color: KelolakuGlobalColor.dark, width: 0.0)),
                  // prefixIcon: Icon(Icons.search_sharp, color: bmPrimaryColor),
                  hintText: 'Masukkan  Link ${widget.socialMedia}',
                  hintStyle: textRegular14.copyWith(color: KelolakuGlobalColor.dark30),
                  suffixIcon: searchText.length > 0 ? Icon(Icons.cancel, color: KelolakuGlobalColor.dark30).onTap((){
                    searchCont.clear();
                    setState(() {
                      searchText = "";
                    });
                  }) : Icon(Icons.cancel, color: Colors.transparent),
                  // const Offstage(),
                ),
                textFieldType: TextFieldType.NAME,
                cursorColor: KelolakuGlobalColor.ocean,
              ),
            ).flexible(flex: 3),
            // TextButton(onPressed: () {}, child: Text('Cancel', style: boldTextStyle(color: bmTextColorDarkMode))),
          ],
        ),
        16.height,
      ],
    );
  }
}
