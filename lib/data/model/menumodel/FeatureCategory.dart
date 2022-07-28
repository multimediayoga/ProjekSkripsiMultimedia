import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/router/route_helper.dart';

import 'feature_model.dart';

List<FeatureCategoryModel> getCategoryMenu() {
  List<FeatureCategoryModel > list = [];

  list.add(FeatureCategoryModel(id: 1, name: 'Laporan dan Kondisi Toko', image: KelolaImage.reportCategoryImage, route: RouteHelper.getStoreReportRoute()));
  list.add(FeatureCategoryModel(id: 2, name: 'Pelanggan Toko', image: KelolaImage.membershipCategoryImage, route: RouteHelper.getStoreBuyerRoute()));
  list.add(FeatureCategoryModel(id: 3, name: 'Kursus', image: KelolaImage.courseCategoryImage, route: RouteHelper.getCourseRoute()));
  list.add(FeatureCategoryModel(id: 4, name: 'Promo Toko', image: KelolaImage.promoCategoryImage, route: RouteHelper.getStorePromoRoute()));
  list.add(FeatureCategoryModel(id: 5, name: 'Atur Etalase Toko', image: KelolaImage.myShopCategoryImage, route: RouteHelper.getStoreSettingRoute()));
  list.add(FeatureCategoryModel(id: 6, name: 'Karyawan', image: KelolaImage.employeeCategoryImage, route: RouteHelper.getStoreEmployeeRoute()));
  list.add(FeatureCategoryModel(id: 7, name: 'Kampanye', image: KelolaImage.campaignCategoryImage, route: RouteHelper.getCampaignRoute()));
  list.add(FeatureCategoryModel(id: 8, name: 'Akun', image: KelolaImage.myAccountCategoryImage, route: RouteHelper.getAccountRoute()));

  // list.add(CategoryModel(id: 1, name: 'Laporan dan Kondisi Toko', image: KelolaImage.reportCategoryImage, router: RouteHelper.storeReport));
  // list.add(CategoryModel(id: 2, name: 'Pelanggan Toko', image: KelolaImage.membershipCategoryImage, router: RouteHelper.storeBuyer));
  // list.add(CategoryModel(id: 3, name: 'Kursus', image: KelolaImage.courseCategoryImage, router: RouteHelper.course));
  // list.add(CategoryModel(id: 4, name: 'Promo Toko', image: KelolaImage.promoCategoryImage, router: RouteHelper.storePromo));
  // list.add(CategoryModel(id: 5, name: 'Atur Etalase Toko', image: KelolaImage.myShopCategoryImage, router: RouteHelper.storeSetting));
  // list.add(CategoryModel(id: 6, name: 'Karyawan', image: KelolaImage.employeeCategoryImage, router: RouteHelper.storeEmployee));
  // list.add(CategoryModel(id: 7, name: 'Kampanye', image: KelolaImage.campaignCategoryImage, router: RouteHelper.campaign));
  // list.add(CategoryModel(id: 8, name: 'Akun', image: KelolaImage.myAccountCategoryImage, router: RouteHelper.account));


  return list;
}