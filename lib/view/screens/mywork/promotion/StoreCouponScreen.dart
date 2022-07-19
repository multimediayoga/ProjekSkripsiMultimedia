import 'package:flutter/material.dart';

import '../../../../helper/reusable_widget.dart';

class StoreCouponScreen extends StatefulWidget {
  const StoreCouponScreen({Key? key}) : super(key: key);

  @override
  State<StoreCouponScreen> createState() => _StoreCouponScreenState();
}

class _StoreCouponScreenState extends State<StoreCouponScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context, pageName: "Promosi Kupon"),
      body: Container(

      ),
    );
  }
}
