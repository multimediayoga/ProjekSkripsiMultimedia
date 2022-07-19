import 'package:flutter/material.dart';
import 'package:kelolapps/helper/reusable_widget.dart';

class PromoPaketBundleScreen extends StatefulWidget {
  const PromoPaketBundleScreen({Key? key}) : super(key: key);

  @override
  State<PromoPaketBundleScreen> createState() => _PromoPaketBundleScreenState();
}

class _PromoPaketBundleScreenState extends State<PromoPaketBundleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context, pageName: "Promosi Kupon"),
      
    );
  }
}
