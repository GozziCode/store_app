import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';
import '../models/product_model.dart';

class GetProductServices {
  Future<ProductModel> getProducts() async {
    final url = AppUrl.baseUrl;

    final request = await http.get(
      Uri.parse(url),
    );

    debugPrint(request.statusCode.toString());

    if (request.statusCode >= 400) {
      throw Exception('Failed to fetch products. Please try again later.');
    }

    if (request.statusCode == 200) {
      if (json.decode(request.body)['items'] == null) {
        return ProductModel();
      } else {
        final productModel = productModelFromJson(request.body);
        return productModel;
      }
    } else {
      return ProductModel();
    }
  }
}
