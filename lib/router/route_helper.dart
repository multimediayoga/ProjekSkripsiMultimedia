// Routes using tag format
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kelolapps/data/model/productmodel/product_model.dart';
import 'package:kelolapps/view/screens/CreateCashTransactionScreen.dart';
import 'package:kelolapps/view/screens/DashboardScreen.dart';
import 'package:kelolapps/view/screens/LoginScreens.dart';
import 'package:kelolapps/view/screens/RegisterScreens.dart';
import 'package:kelolapps/view/screens/StoreRegisterWalkthroughScreen.dart';
import 'package:kelolapps/view/screens/digital_shop/DigitalProductDetailScreen.dart';
import 'package:kelolapps/view/screens/digital_shop/DigitalShopHomeScreen2.dart';
import 'package:kelolapps/view/screens/digital_shop/DigitalShopInfoScreen.dart';
import 'package:kelolapps/view/screens/digital_shop/DigitalShopPromoScreen.dart';
import 'package:kelolapps/view/screens/fragments/main_board/transaction_fragment.dart';
import 'package:kelolapps/view/screens/mywork/campaign/CampaignAddSocialMediaScreen.dart';
import 'package:kelolapps/view/screens/mywork/campaign/CampaignPacketScreen.dart';
import 'package:kelolapps/view/screens/mywork/campaign/CampaignPageScreen.dart';
import 'package:kelolapps/view/screens/mywork/campaign/CampaignProductScreen.dart';
import 'package:kelolapps/view/screens/mywork/promotion/CreatePaketBundleScreen.dart';
import 'package:kelolapps/view/screens/mywork/promotion/StoreCouponScreen.dart';
import 'package:kelolapps/view/screens/mywork/promotion/StorePaketBundleScreen.dart';
import 'package:kelolapps/view/screens/other_menu/AccountScreen.dart';
import 'package:kelolapps/view/screens/other_menu/CourseScreen.dart';
import 'package:kelolapps/view/screens/other_menu/MembershipScreen.dart';
import 'package:kelolapps/view/screens/other_menu/PromoScreen.dart';
import 'package:kelolapps/view/screens/mywork/ReportScreen.dart';
import 'package:kelolapps/view/screens/other_menu/StoreCampaignScreen.dart';
import 'package:kelolapps/view/screens/other_menu/StoreEmployeeScreen.dart';
import 'package:kelolapps/view/screens/other_menu/StoreSettingScreen.dart';

import '../splashscreen.dart';
import '../view/screens/mywork/promotion/CreateCouponScreen.dart';
import '../view/screens/mywork/promotion/UpdatePaketBundleScreen.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    //ExampleScreenListing.tag: (context) => ExampleScreenListing(ClassContainsInfo()),
  };
}

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String dashboard = '/dashboard';
  static const String getDashboardRoute = '$dashboard';

  static const String onBoarding = '/on-boarding';

  static const String login = '/login';

  static getLoginRoute(
          {required String username,
          required String phoneNumber,
          required String email}) =>
      "$login";

  static const String signUp = '/register';
  static getSignUpRoute() => '$signUp';

  static const String storeRegister = '/register-store';
  static getStoreRegisterRoute() => '$storeRegister';

  static const String storeOrders = '/orders';
  static String getStoreOrderListRoute() => '$storeOrders';

  //Menu Route
  static const String storeReport = '/report';
  static const String storeBuyer = '/membership';
  static const String course = '/course';
  static const String storePromo = '/promo';
  static const String storeSetting = '/store-setting';
  static const String storeEmployee = '/store-employee';
  static const String campaign = '/campaign';
  static const String account = '/my-account';

  static String getStoreReportRoute() => '$storeReport';
  static String getStoreBuyerRoute() => '$storeBuyer'; //Membership = Buyer
  static String getCourseRoute() => '$course';
  static String getStorePromoRoute() => '$storePromo';
  static String getStoreSettingRoute() => '$storeSetting';
  static String getStoreEmployeeRoute() => '$storeEmployee';
  static String getCampaignRoute() => '$campaign';
  static String getAccountRoute() => '$account';

  //Transaction
  static const String createTransaction = '/create-transaction';
  static const String updateTransaction = '/update-transaction';

  static String getCreateTransactionRoute() => '$createTransaction';
  static String getUpdateTransactionRoute() => '$updateTransaction';

  //Digital-Shop
  static const String digitalStore = '/digital-store';
  static String getDigitalStore() => '$digitalStore';

  static const String viewDigitalStoreInfo = '/view-store-info';
  static  String getViewDigitalStoreInfo () => '$viewDigitalStoreInfo';

  static const String viewPromoStoreInfo = '/view-promo';
  static  String getViewDigitalStorePromo () => '$viewPromoStoreInfo';

  static const String productDetails = '/product-details';
  static  String getProductDetailsRoute () => '$productDetails';

  // static String getProductDetailsRoute(ProductModel product) {
  //   // List<int> _encoded = utf8.encode(jsonEncode(product.toJson()));
  //   // String _data = base64Encode(_encoded);
  //   // return '$productDetails?data=$_data';
  //   return '$productDetails';
  // }

  static const String campaignPacket = '/campaign-packet';
  static  String getCampaignPacket () => '$campaignPacket';

  static const String campaignPageScreen = '/campaign-page';
  static  String getCampaignPageScreen () => '$campaignPageScreen';

  static const String campaignProductScreen = '/campaign-product';
  static  String getCampaignProductScreen () => '$campaignProductScreen';

  static const String campaignSocialMediaScreen = '/campaign-social-media';
  static  String getCampaignSocialMediaScreen () => '$campaignSocialMediaScreen';

  //Create Promo
  static const String storeCouponsPage = '/store-coupons';
  static  String getStoreCouponsPage () => '$storeCouponsPage';

  static const String storePaketBundlePage = '/store-paket-bundle';
  static  String getStorePaketBundlePage () => '$storePaketBundlePage';

  static const String createPaketBundlePage = '/create-paket-bundle';
  static  String getCreatePaketBundlePage () => '$createPaketBundlePage';

  static const String createStoreCouponPage = '/create-store-coupon';
  static  String getCreateStoreCouponPage () => '$createStoreCouponPage';

  //Update Promo
  static const String updatePaketBundlePage = '/update-paket-bundle';
  static  String getUpdatePaketBundlePage () => '$updatePaketBundlePage';

  static List<GetPage> routes = [

    //Update Promo
    GetPage(name: updatePaketBundlePage, page: ()=>UpdatePaketBundleScreen()),


    //Create Promo
    GetPage(name: storePaketBundlePage, page: ()=>PromoPaketBundleScreen()),
    GetPage(name: storeCouponsPage, page: ()=> StoreCouponScreen()),
    GetPage(name: createStoreCouponPage, page: ()=> CreateCouponScreen()),
    GetPage(name: createPaketBundlePage, page: ()=> CreatePaketBundle()),

    //Campaign
    GetPage(name: campaignPageScreen, page: ()=> CampaignPageScreen()),
    GetPage(name: campaignProductScreen, page: ()=> CampaignProductScreen()),
    GetPage(name: campaignPacket, page: ()=> CampaignPacketScreen()),
    GetPage(name: campaignSocialMediaScreen, page: ()=> CampaignAddSocialMediaScreen()),

    //Digital Store
    GetPage(name: digitalStore, page: ()=> DigitalStoreHomeScreen()),
    GetPage(name: viewDigitalStoreInfo, page: ()=> DigitalShopInfoScreen()),
    GetPage(name: viewPromoStoreInfo, page: ()=> DigitalShopPromoScreen()),
    GetPage(name: productDetails, page: (){
      DigitalProductDetailScreen _productData = Get.arguments;
      return _productData;
    }) ,

    // GetPage(name: initial, page: () => DashboardScreen(pageIndex: 0)),
    GetPage(name: splash, page: () => const SplashScreenPage()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: signUp, page: () => RegisterScreen()),
    GetPage(name: storeRegister, page: () => StoreRegisterWalkthroughScreen()),
    GetPage(name: dashboard, page: () => DashboardScreen()),

    //Transaction
    GetPage(name: storeOrders, page: () => TransactionFragment()),
    GetPage(name: createTransaction, page: () => CreateCashTransaction()),

    //  Other Menu Page
    GetPage(name: storeReport, page: () => ReportScreen()),
    GetPage(name: storeBuyer, page: () => MembershipScreen()),
    GetPage(name: course, page: () => CourseScreen()),
    GetPage(name: storePromo, page: () => PromoScreen()),
    GetPage(name: storeSetting, page: () => StoreSettingScreen()),
    GetPage(name: storeEmployee, page: () => StoreEmployeeScreen()),
    GetPage(name: campaign, page: () => StoreCampaignScreen()),
    GetPage(name: account, page: () => AccountScreen()),
  ];
}
