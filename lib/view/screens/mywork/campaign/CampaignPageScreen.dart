import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kelolapps/utils/AppWidget.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../config/kelolaku/color_style.dart';
import '../../../../config/kelolaku/text_style.dart';
import '../../../../helper/reusable_widget.dart';
import '../../sheets/share_to_social.dart';

class CampaignPageScreen extends StatefulWidget {
  const CampaignPageScreen({Key? key}) : super(key: key);

  @override
  State<CampaignPageScreen> createState() => _CampaignPageScreenState();
}

class _CampaignPageScreenState extends State<CampaignPageScreen> {
  String degreeValue = 'Link Etalase Toko';
  String linkMyKelolaStore = 'https://kelolaku.com/majumakmur';
  String linkMyKelolaBio = 'https://kelolaku.com/majumakmur/bio';

  var items = [
    'Link Etalase Toko',
    'Link Profil Toko',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: KelolakuGlobalColor.light70,
          automaticallyImplyLeading: false,
          title: Text("Promosikan Toko",
              style: heading3.copyWith(color: KelolakuGlobalColor.dark)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,
                color: KelolakuGlobalColor.dark, size: 20),
          ),
        ),
        body: Container(
          margin:
              EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_4),
          child: SingleChildScrollView(
            child: Column(
              children: [
                32.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Pilih Link Laman untuk Dibagikan",
                    style: heading3.copyWith(color: KelolakuGlobalColor.dark60),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                16.height,
                DropdownChoiceContainer(
                    degreeValue: degreeValue,
                    itemsData: items,
                    changeValue: (String? newValue) {
                      setState(() {
                        degreeValue = newValue!;
                      });
                    }),
                32.height,
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                      color: KelolakuGlobalColor.ocean,
                    )),
                  ),
                  child: Text(
                    degreeValue == items[0] ? linkMyKelolaStore : linkMyKelolaBio,
                    style:
                        textSemibold16.copyWith(color: KelolakuGlobalColor.ocean),
                  ),
                ),
                64.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Masukkan Teks Tambahan (Opsional)",
                    style: heading3.copyWith(color: KelolakuGlobalColor.dark60),
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                16.height,
                editTextStyle("Masukkan teks menarik agar tokomu semakin sering dikunjungi", line: 5, fillColored: Colors.white, enabledColor: KelolakuGlobalColor.lightBorderInput, focusedColor: KelolakuGlobalColor.ocean),
                64.height,
                AppButton(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.share, color: white),
                      4.width,
                      Text('Bagikan Link', style: boldTextStyle(color: white)),
                    ],
                  ),
                  color: KelolakuGlobalColor.deepBlue,
                  shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onTap: () {
                    //
                    showSocialSharingLink(context, sharedLink: 'a');
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}
