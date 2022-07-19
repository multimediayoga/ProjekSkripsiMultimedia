import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/image.dart';
import '../../../helper/reusable_widget.dart';
import '../../../route/route_helper.dart';

class PromoScreen extends StatefulWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  State<PromoScreen> createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  @override
  Widget build(BuildContext context) {
    var height1 = MediaQuery.of(context).size.height * 0.20566502463;
    var height2 = MediaQuery.of(context).size.height * 0.3374384236453202;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: KelolakuGlobalColor.light70,
          title: Text("Buat Promosi",
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Get.toNamed(RouteHelper.storeCouponsPage);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 16, horizontal: Dimensions.MARGIN_SIZE_GRID_8),
                    padding: EdgeInsets.all(16),
                    height: context.height() * 0.21798029556,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: KelolakuGlobalColor.red40,
                      boxShadow: [
                        BoxShadow(
                            color: KelolakuGlobalColor.dark.withOpacity(0.3),
                            offset: Offset(0.0, 1.0),
                            blurRadius: 2.0),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Align(
                                  child: Text(
                                    "Buat Kupon",
                                    style: heading1.copyWith(
                                        color: KelolakuGlobalColor.light70),
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                                8.height,
                                Text(
                                  "Tarik perhatian pelanggan untuk membeli dengan \n total tertentu dengan memberi potongan harga!",
                                  maxLines: 5,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: textSemibold14.copyWith(color: white),
                                ),
                              ],
                            ).expand(flex: 1),
                            Column(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: commonCachedNetworkImage(
                                    KelolaImage.campaignBoxed,
                                    height: context.height() * 0.12192118226,
                                    width: context.height() * 0.12192118226,
                                    alignment: Alignment.bottomRight,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(12),
                                      primary: white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    onPressed: () {
                                      Get.toNamed(RouteHelper.storeCouponsPage);
                                    },
                                    child: Text('Buat Kupon',
                                        style: TextStyle(
                                            color: KelolakuGlobalColor.red40,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ).expand(flex: 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // 4.height,
                InkWell(
                  onTap: (){
                    Get.toNamed(RouteHelper.storePaketBundlePage);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 16, horizontal: Dimensions.MARGIN_SIZE_GRID_8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: context.height() * 0.21798029556,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: KelolakuGlobalColor.colorPrimaryLogo,
                      boxShadow: [
                        BoxShadow(
                            color: KelolakuGlobalColor.dark.withOpacity(0.3),
                            offset: Offset(0.0, 1.0),
                            blurRadius: 2.0),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: commonCachedNetworkImage(
                                    // placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
                                    KelolaImage.campaignBundleFront,
                                    usePlaceholderIfUrlEmpty: true,
                                    height: context.height() * 0.1908866995,
                                    // width: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ).expand(flex: 1),
                            16.width,
                            Column(
                              children: [
                                Align(
                                  child: Text(
                                    "Buat Produk Pastel",
                                    style: heading1.copyWith(
                                        color: KelolakuGlobalColor.light70),
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                                8.height,
                                Text(
                                  "Produk terbaikmu tidak laku? \nGabungkan dengan produk larismu dan tarik pembeli untuk belanja dengan promo paket",
                                  maxLines: 7,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: textSemibold14.copyWith(color: white),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(vertical: 4),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(12),
                                      primary: white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                    onPressed: () {
                                      Get.toNamed(RouteHelper.storePaketBundlePage);
                                    },
                                    child: Text('Buat Paket',
                                        style: TextStyle(
                                            color: KelolakuGlobalColor
                                                .colorPrimaryExtra,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ).expand(flex: 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
