import 'package:flutter/material.dart';
import 'package:kelolapps/helper/reusable_widget.dart';
import 'package:kelolapps/view/screens/mywork/report_widget/report/product_min_report_model.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductListingFragment extends StatefulWidget {
  const ProductListingFragment({Key? key}) : super(key: key);

  @override
  _ProductListingFragmentState createState() => _ProductListingFragmentState();
}

class _ProductListingFragmentState extends State<ProductListingFragment> {
  final List<SneakerShoppingModel> list = SneakerRepo.getAllCart();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(top: 8, bottom: 8),
            child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white12, width: 1),
                    ),
                    child: commonCachedNetworkImage(
                      list[index].img!,
                      height: 80,
                      width: 140,
                      fit: BoxFit.cover,
                    ).cornerRadiusWithClipRRect(8),
                  ),
                  SizedBox(height: 16, width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(list[index].name!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: boldTextStyle()),
                      SizedBox(height: 4),
                      Text(list[index].subtitle!, textAlign: TextAlign.start, overflow: TextOverflow.clip, style: secondaryTextStyle()),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            list[index].amount!,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.clip,
                            style: boldTextStyle(size: 14),
                          ),
                          SizedBox(width: 32),
                          Text('Unit', style: secondaryTextStyle(size: 14))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
