import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget waStatisticsWidget({String? title, String? amount, Color? color, IconData? icons}) {
  return Container(
    decoration: boxDecorationRoundedWithShadow(12, backgroundColor: white),
    padding: EdgeInsets.all(16),
    child: Row(
      children: [
        Container(
          decoration: boxDecorationWithRoundedCorners(backgroundColor: color!.withOpacity(0.1)),
          height: 75,
          width: 75,
          padding: EdgeInsets.all(12),
          child: Icon(icons, color: color),
        ),
        8.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(amount!, style: boldTextStyle(size: 24)),
            4.height,
            Text(title!, style: secondaryTextStyle(size: 18)),
          ],
        ),
      ],
    ),
  );
}