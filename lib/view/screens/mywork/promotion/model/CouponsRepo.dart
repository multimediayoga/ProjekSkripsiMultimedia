class CouponModel{
  String codeCoupon = "";
  String memberName = "Semua Pembeli";
  double? minimumPrice;
  double? discountPrice;

  CouponModel({required this.codeCoupon, required this.memberName, this.minimumPrice, this.discountPrice});
}

List<CouponModel> getCouponData(){
  List<CouponModel> list = [];

  CouponModel couponModel1 = CouponModel(codeCoupon: "TAHUNBARU", memberName: "Semua Member", minimumPrice: 2000000, discountPrice: 100000);
  CouponModel couponModel2 = CouponModel(codeCoupon: "PELANGGANSETIA", memberName: "Semua Pembeli", minimumPrice: 1500000, discountPrice: 100000);

  list.add(couponModel1);
  list.add(couponModel2);

  return list;
}

