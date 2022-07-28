class MembershipModel{
  String membershipName;
  MembershipModel({required this.membershipName});
}

List<MembershipModel> getMembership(){
  List<MembershipModel> list = [];
  list.add(MembershipModel(membershipName: "Semua Pembeli"));
  list.add(MembershipModel(membershipName: "Semua Membership"));
  list.add(MembershipModel(membershipName: "Pecinta Baju"));
  list.add(MembershipModel(membershipName: "Pahlawan Toko"));
  return list;
}