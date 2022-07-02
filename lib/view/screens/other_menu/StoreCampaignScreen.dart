import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:kelolapps/utils/fluk/AppTheme.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreCampaignScreen extends StatefulWidget {
  const StoreCampaignScreen({Key? key}) : super(key: key);

  @override
  _StoreCampaignScreenState createState() => _StoreCampaignScreenState();
}

class _StoreCampaignScreenState extends State<StoreCampaignScreen> {
  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height * 0.20566502463;
    var height2 = MediaQuery.of(context).size.height * 0.3374384236453202;
    var width1 = MediaQuery.of(context).size.width / 2 * 0.8;
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
        body: SafeArea(
            child: Container(
          margin:
              EdgeInsets.symmetric(horizontal: Dimensions.MARGIN_SIZE_GRID_8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                32.height,
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Raih pasar lebih luas',
                    style: heading1.copyWith(color: KelolakuGlobalColor.dark60),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                8.height,
                Text(
                  "Bagikan produk, promo ke sosial media  untuk menjangkau lebih banyak pembeli",
                  style:
                      textRegular20.copyWith(color: KelolakuGlobalColor.dark),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                16.height,
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          height: height1,
                          width: width1,
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.circular(16),
                            backgroundColor: KelolakuGlobalColor.green,
                            boxShadow: defaultBoxShadow(),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  KelolaImage.campaignHandToko,
                                  height: height1 * 0.7,
                                  fit: BoxFit.cover,
                                ).expand(),
                                Text("Kampanyekan Toko", style: heading2.copyWith(color: KelolakuGlobalColor.light70),).paddingAll(8),
                                4.height
                              ],
                            ),
                          ),
                        ),
                        4.height,
                        Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(8),
                          height: height2,
                          width: width1,
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.circular(16),
                            backgroundColor: KelolakuGlobalColor.light60,
                            boxShadow: defaultBoxShadow(),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                KelolaImage.campaignBundle,
                                height: height1 * 0.7,
                                fit: BoxFit.cover,
                              ).expand(),
                              Text("Kampanyekan Produk", style: heading2.copyWith(color: KelolakuGlobalColor.dark60),),
                            ],
                          ),
                        )
                      ],
                    ),
                    4.width,
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(8),
                          height: height2,
                          width: width1,
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.circular(16),
                            backgroundColor: KelolakuGlobalColor.light60,
                            boxShadow: defaultBoxShadow(),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                KelolaImage.campaignAddSocial,
                                height: height1 * 0.7,
                                fit: BoxFit.cover,
                              ).expand(),
                              Text("Tambahkan Sosial Media", style: heading2.copyWith(color: KelolakuGlobalColor.dark60),).paddingAll(8),
                            ],
                          ),
                        ),
                        4.height,
                        Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(8),
                          height: height1,
                          width: width1,
                          decoration: boxDecorationWithRoundedCorners(
                            borderRadius: BorderRadius.circular(16),
                            backgroundColor: KelolakuGlobalColor.colorPrimaryLogo,
                            boxShadow: defaultBoxShadow(),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                KelolaImage.campaignBoxed,
                                height: height1 * 0.7,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment.centerLeft,
                              ).expand(),
                              Text("Kampanyekan Promo", style: heading2.copyWith(color: KelolakuGlobalColor.light70),).paddingAll(8),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
