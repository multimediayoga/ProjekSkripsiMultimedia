import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../fragments/social_media_input_fragment.dart';

class CampaignAddSocialMediaScreen extends StatefulWidget {
  const CampaignAddSocialMediaScreen({Key? key}) : super(key: key);

  @override
  State<CampaignAddSocialMediaScreen> createState() =>
      _CampaignAddSocialMediaScreenState();
}

class _CampaignAddSocialMediaScreenState
    extends State<CampaignAddSocialMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(
        context,
        pageName: 'Tambahkan Sosial Media',
      ),
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
                margin: EdgeInsets.all(Dimensions.MARGIN_SIZE_GRID_6),
                child: Column(
                  children: [
                    BMSocialInputWidget(
                      socialIcon: MdiIcons.instagram,
                      socialMedia: "Instagram",
                    ),
                    16.height,
                    BMSocialInputWidget(
                      socialIcon: MdiIcons.facebook,
                      socialMedia: "Facebook",
                    ),
                    16.height,
                    BMSocialInputWidget(
                      socialIcon: Icons.tiktok,
                      socialMedia: "Tiktok",
                    ),
                  ],
                )),
          ),
          16.height,
          Positioned(
            left: 16,
            right: 17,
            bottom: 0,
            child: AppButton(
              color: KelolakuGlobalColor.ocean,
              shapeBorder:
                  RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
              width: context.width(),
              onTap: () {},
              child: Text("Simpan Sosial Media", style: boldTextStyle(color: white)),
            ),
          ),
        ],
      )),
    );
  }
}
