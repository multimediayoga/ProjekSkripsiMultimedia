import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kelolapps/helper/reusable_widget.dart';

class UpdatePaketBundleScreen extends StatefulWidget {
  const UpdatePaketBundleScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePaketBundleScreen> createState() => _UpdatePaketBundleScreenState();
}

class _UpdatePaketBundleScreenState extends State<UpdatePaketBundleScreen> {
  late File imageFile;
  bool loadFromFile = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().getImage(source: source);
    setState(
          () {
        if (image != null) {
          imageFile = File(image.path);
          loadFromFile = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var widthMax = MediaQuery.of(context).size.width;
    var heightBigImage = MediaQuery.of(context).size.height * 0.4027093596;
    var widthBigImage = MediaQuery.of(context).size.width * 0.49333333333;

    return SafeArea(child: Scaffold(
      appBar: GlobalFunction.kelolakuAppbarMinimal(context,
          pageName: "Perbarui Paket Bundle"),
      body: Container(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [

                  ],
                ),
              )
            ],
          )
      ),
    ));
  }
}
