import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/view/screens/mywork/employee_widget/employee_card.dart';
import 'package:kelolapps/view/screens/sheets/employee_sheet.dart';
import 'package:nb_utils/nb_utils.dart';

import '../mywork/model/EmployeeRepo.dart';

class StoreEmployeeScreen extends StatefulWidget {
  const StoreEmployeeScreen({Key? key}) : super(key: key);

  @override
  _StoreEmployeeScreenState createState() => _StoreEmployeeScreenState();
}

class _StoreEmployeeScreenState extends State<StoreEmployeeScreen> {
  late List<NewQuizModel> mList;
  late var accountOwner;

  @override
  void initState() {
    super.initState();
    accountOwner = geMytUserData();
    mList = getQuizData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: KelolakuGlobalColor.light70,
          title: Text("Pengurus Toko",
              style: heading3.copyWith(color: KelolakuGlobalColor.dark)),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios,
                color: KelolakuGlobalColor.dark, size: 20),
          ),
          actions: [
            TextIcon(
                text: "Menu",
                textStyle:
                    textSemibold14.copyWith(color: KelolakuGlobalColor.ocean60),
                suffix: const Icon(Icons.keyboard_arrow_down,
                    color: KelolakuGlobalColor.ocean60),
                onTap: () {
                  showEmployeeOptionSheet(context);
                })
          ],
        ),
        body: SafeArea(
            child: Container(
          child: Column(
            children: [
              16.height,
              Container(
                child: EmployeeCard(model: accountOwner),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      16.height,
                      ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: mList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return EmployeeCard(model: mList[index],);
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
