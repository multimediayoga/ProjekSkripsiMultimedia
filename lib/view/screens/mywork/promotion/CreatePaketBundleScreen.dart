import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../helper/reusable_widget.dart';

class CreatePaketBundle extends StatefulWidget {
  const CreatePaketBundle({Key? key}) : super(key: key);

  @override
  State<CreatePaketBundle> createState() => _CreatePaketBundleState();
}

class _CreatePaketBundleState extends State<CreatePaketBundle> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context,
          pageName: "Buat Paket Bundle Baru"),
      body: Container(
        child: Column(
          children: [

          ],
        )
      ),
    ));
  }
}
