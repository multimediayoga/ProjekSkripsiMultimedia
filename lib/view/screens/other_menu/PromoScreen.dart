import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:nb_utils/nb_utils.dart';

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
          title: Text("Promo Toko",
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
                32.height,
                Text(
                  'Raih pasar lebih luas',
                  style: heading1.copyWith(color: KelolakuGlobalColor.dark60),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                8.height,
                Text(
                  "Bagikan produk, promo ke sosial media  untuk menjangkau lebih banyak pembeli",
                  style:
                      textRegular16.copyWith(color: KelolakuGlobalColor.dark),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(8),
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: BorderRadius.circular(16),
                        backgroundColor: white,
                        boxShadow: defaultBoxShadow(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
