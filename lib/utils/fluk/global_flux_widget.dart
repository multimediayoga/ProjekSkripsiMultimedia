
import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:flutx/widgets/text/text.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

import '../AppWidget.dart';
import 'AppTheme.dart';

class SortBottomSheet extends StatefulWidget {
  @override
  _SortBottomSheetState createState() => _SortBottomSheetState();
}

class _SortBottomSheetState extends State<SortBottomSheet> {
  int _radioValue = 0;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: FxSpacing.xy(24, 16),
        decoration: const BoxDecoration(
            color: KelolakuGlobalColor.light60,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FxSpacing.height(8),
            Column(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      _radioValue = 0;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Radio(
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 0;
                          });
                        },
                        groupValue: _radioValue,
                        value: 0,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                      ),
                      FxText.titleSmall("Link - ", fontWeight: 60),
                      FxText.titleSmall("Etalase"),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _radioValue = 1;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Radio(
                        onChanged: (dynamic value) {
                          setState(() {
                            _radioValue = 1;
                          });
                        },
                        groupValue: _radioValue,
                        value: 1,
                        visualDensity: VisualDensity.compact,
                        activeColor: theme.colorScheme.primary,
                      ),
                      FxText.titleSmall("Link - ", fontWeight: 600),
                      FxText.titleSmall("Bio Toko"),
                    ],
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       _radioValue = 2;
                //     });
                //   },
                //   child: Row(
                //     children: <Widget>[
                //       Radio(
                //         onChanged: (dynamic value) {
                //           setState(() {
                //             _radioValue = 2;
                //           });
                //         },
                //         groupValue: _radioValue,
                //         value: 2,
                //         visualDensity: VisualDensity.compact,
                //         activeColor: theme.colorScheme.primary,
                //       ),
                //       FxText.titleSmall("Name - ", fontWeight: 600),
                //       FxText.titleSmall("A to Z"),
                //     ],
                //   ),
                // ),
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       _radioValue = 3;
                //     });
                //   },
                //   child: Row(
                //     children: <Widget>[
                //       Radio(
                //         onChanged: (dynamic value) {
                //           setState(() {
                //             _radioValue = 3;
                //           });
                //         },
                //         groupValue: _radioValue,
                //         value: 3,
                //         visualDensity: VisualDensity.compact,
                //         activeColor: theme.colorScheme.primary,
                //       ),
                //       FxText.titleSmall("Name - ", fontWeight: 600),
                //       FxText.titleSmall("Z to A"),
                //     ],
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}