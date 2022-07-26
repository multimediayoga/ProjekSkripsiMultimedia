import 'package:flutter/material.dart';
import 'package:flutx/utils/spacing.dart';
import 'package:kelolapps/view/screens/mywork/promotion/model/MemberRepo.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../../config/kelolaku/color_style.dart';
import '../../../../../config/kelolaku/text_style.dart';

class ChooseMembershipWidget extends StatefulWidget {
  final int? selectedMember;
  const ChooseMembershipWidget({Key? key, required this.selectedMember}) : super(key: key);

  @override
  _ChooseMembershipWidgetState createState() => _ChooseMembershipWidgetState();
}

class _ChooseMembershipWidgetState extends State<ChooseMembershipWidget> {
  List<MembershipModel> membershipList = getMembership();
  int iteration = -1;
  String getUpdatedMemberName = "";
  int? _selectedMember;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
    _selectedMember = widget.selectedMember;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        padding: FxSpacing.xy(24, 16),
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        child:  Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            shrinkWrap: true,
            itemCount: membershipList.length,
            itemBuilder: (_, index) {
              iteration++;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Radio(
                      onChanged: (dynamic value) {
                        setState(() {
                          _selectedMember = index;
                          getUpdatedMemberName = membershipList[index].membershipName;
                        });
                      },
                      groupValue: _selectedMember,
                      value: iteration == 0 ? iteration : index,
                      visualDensity: VisualDensity.compact,
                      activeColor: KelolakuGlobalColor.colorPrimaryExtra,
                    ),
                    8.width,
                    Text(membershipList[index].membershipName, style: textSemibold16.copyWith(color: KelolakuGlobalColor.dark),)
                  ],
                ),
              ).onTap((){
                _selectedMember = index;
                getUpdatedMemberName = membershipList[index].membershipName;
                setState(() { });
              });
            },
          )
        ],
      ),
      ),
    );
  }
}
