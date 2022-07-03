import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/data/model/selected_model.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../config/image.dart';
import '../../../config/kelolaku/color_style.dart';
import '../../../utils/AppWidget.dart';
import '../../../utils/app_strings.dart';

void showBookBottomSheet(BuildContext context, KSelectOptionsModel element) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(
          borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon: Icon(Icons.cancel_rounded, color: Colors.orange),
                ),
              ),
              // titleText(title: element.name, size: 24),
              16.height,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                style: heading2,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // titleText(title: element.title ,size: 16,maxLines: 2),
                      Text(
                        element.title,
                        style: large36,
                      )
                    ],
                  ),
                  AppButton(
                    //padding: EdgeInsets.all(0),
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    child: Text(
                      'Book Now',
                    ),
                    color: Colors.green,
                    onTap: () {
                      // BMCalenderScreen(element: element,isStaffBooking: false).launch(context);
                    },
                  ),
                ],
              )
            ],
          ).paddingAll(16);
        });
      });
}

Future showSocialSharing(BuildContext context, {String? sharedLink}) {
  return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 200),
              child: SizedBox(
                width: 45,
                height: 45,
                child: FloatingActionButton(
                  onPressed: () {
                    finish(context);
                  },
                  backgroundColor: KelolakuGlobalColor.light70,
                  child:
                      const Icon(Icons.close, color: KelolakuGlobalColor.dark),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
                // color: KelolakuGlobalColor.light60,
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(AppString.shareTo,
                        style:
                            heading3.copyWith(color: KelolakuGlobalColor.dark)),
                    const SizedBox(height: 20),
                    /**/
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Icon(Icons.keyboard_arrow_left, size: 24),
                        Container(
                          width: MediaQuery.of(context).size.width - 90,
                          height: 50,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                shareIcon(KelolaImage.t2_whatsup,
                                    KelolakuGlobalColor.green),
                                shareIcon(KelolaImage.t2_facebook,
                                    KelolakuGlobalColor.deepBlue),
                                shareIcon(KelolaImage.t2_instagram,
                                    KelolakuGlobalColor.red),
                                shareIcon(KelolaImage.t2_linkedin,
                                    KelolakuGlobalColor.deepBlue40),
                              ],
                            ),
                          ),
                        ),
                        const Icon(Icons.keyboard_arrow_right, size: 24),
                      ],
                    ),
                    sharedLink.validate().isEmpty ?
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(16),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                          borderRadius: radius(16),
                          color: KelolakuGlobalColor.lightSmoke),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            sharedLink!,
                            style: textRegular16,
                            overflow: TextOverflow.ellipsis,
                          ).center(),
                          Icon(Icons.copy, color: Colors.black45).onTap(() {
                            Clipboard.setData(
                                ClipboardData(text: sharedLink));
                            toast('Link Disalin.',
                                bgColor: Colors.black.withOpacity(0.5));
                          })
                        ],
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
          ],
        );
      });
}

void showSocialSharingLink(BuildContext aContext, {required String sharedLink}) {
  showModalBottomSheet(
    context: aContext,
    backgroundColor: aContext.scaffoldBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (builder) {
      return Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 200),
            child: SizedBox(
              width: 45,
              height: 45,
              child: FloatingActionButton(
                onPressed: () {
                  finish(aContext);
                },
                backgroundColor: KelolakuGlobalColor.light70,
                child:
                const Icon(Icons.close, color: KelolakuGlobalColor.dark),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              // color: KelolakuGlobalColor.light60,
              width: MediaQuery.of(aContext).size.width,
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(AppString.shareTo,
                      style:
                      heading3.copyWith(color: KelolakuGlobalColor.dark)),
                  const SizedBox(height: 20),
                  /**/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Icon(Icons.keyboard_arrow_left, size: 24),
                      Container(
                        width: MediaQuery.of(aContext).size.width - 90,
                        height: 50,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              shareIcon(KelolaImage.t2_whatsup,
                                  KelolakuGlobalColor.green),
                              shareIcon(KelolaImage.t2_facebook,
                                  KelolakuGlobalColor.deepBlue),
                              shareIcon(KelolaImage.t2_instagram,
                                  KelolakuGlobalColor.red),
                              shareIcon(KelolaImage.t2_linkedin,
                                  KelolakuGlobalColor.deepBlue40),
                            ],
                          ),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right, size: 24),
                    ],
                  ),
                  sharedLink != 'a' ?
                  Container(
                    height: 50,
                    margin: EdgeInsets.all(16),
                    padding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                        borderRadius: radius(16),
                        color: KelolakuGlobalColor.lightSmoke),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sharedLink,
                          style: textRegular16,
                          overflow: TextOverflow.ellipsis,
                        ).center(),
                        Icon(Icons.copy, color: Colors.black45).onTap(() {
                          Clipboard.setData(
                              ClipboardData(text: sharedLink));
                          toast('Link Disalin.',
                              bgColor: Colors.black.withOpacity(0.5));
                        })
                      ],
                    ),
                  ) : Container(),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}