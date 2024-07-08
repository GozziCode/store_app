import 'package:flutter/material.dart';
import 'package:store_app/key/secrets.dart';

class AppColors {
  static const black = Colors.black;
  static const white = Colors.white;
  static const bgColor = Color(0xFFE1D7CA);
  static const cardBgColor = Color(0xFFF8F5F2);
  static const primaryColor = Color(0xfffe8101);
  static const red = Color(0xffd32f2f);
  static const green = Color(0xff388e3c);
}

class Spref {
  static const String isLight = "isLight";
}

class AppUrl {
  static String baseUrl =
      'https://api.timbu.cloud/products?organization_id=$orgId&reverse_sort=false&page=1&size=10&Appid=$myAppId&Apikey=$myApiKey';

      static String imgUrl = "http://api.timbu.cloud/images/";
}
