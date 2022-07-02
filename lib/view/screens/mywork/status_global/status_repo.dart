import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

import 'package:kelolapps/config/kelolaku/constant.dart';

class T12Service {
  var img;
  var serviceName;

  T12Service({this.img, this.serviceName});
}

const t12_walk = "${PUBLIC_IMAGES_URL}/t12_walk.png";
const t12_logo = "${PUBLIC_IMAGES_URL}/t12_ic_profile.jpeg";
const t12_profile = "${PUBLIC_IMAGES_URL}/t12_ic_profile.jpeg";
const t12_atm = "${PUBLIC_IMAGES_URL}/atm.png";
const t12_bank = "${PUBLIC_IMAGES_URL}/bank.png";
const t12_bill = "${PUBLIC_IMAGES_URL}/bill.png";
const t12_card = "${PUBLIC_IMAGES_URL}/card.png";
const t12_card_1 = "${PUBLIC_IMAGES_URL}/card_1.png";
const t12_coupon = "${PUBLIC_IMAGES_URL}/coupon.png";
const t12_credit = "${PUBLIC_IMAGES_URL}/credit.png";
const t12_device = "${PUBLIC_IMAGES_URL}/device.png";
const t12_ic_logo = "${PUBLIC_IMAGES_URL}/ic_logo.png";
const t12_invoice = "${PUBLIC_IMAGES_URL}/invoice.png";
const t12_lending = "${PUBLIC_IMAGES_URL}/lending.png";
const t12_mastercard = "${PUBLIC_IMAGES_URL}/mastercard.png";
const t12_money = "${PUBLIC_IMAGES_URL}/money.png";
const t12_money_1 = "${PUBLIC_IMAGES_URL}/money_1.png";
const t12_payment = "${PUBLIC_IMAGES_URL}/payment.png";
const t12_pie_chart = "${PUBLIC_IMAGES_URL}/pie-chart.png";
const t12_t5_bg_card_2 = "${PUBLIC_IMAGES_URL}/t5_bg_card_2.png";
const t12_tick = "${PUBLIC_IMAGES_URL}/tick.png";
const t12_transaction = "${PUBLIC_IMAGES_URL}/transaction.png";
const t12_foodpanda = "${PUBLIC_IMAGES_URL}/foodpanda.png";

List<T12Service> getSearchList() {
  List<T12Service> list = [];
  list.add(T12Service(img: t12_transaction, serviceName: "1 Produk Perlu Restok"));
  list.add(T12Service(img: t12_bill, serviceName: "1 Produk Disembunyikan"));
  list.add(T12Service(img: t12_card, serviceName: "Ada Order yang belum Dilunasi"));
  return list;
}