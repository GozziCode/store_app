import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constant/constant.dart';
import '../models/product_model.dart';

class GetProductServices {
  Future<ProductModel> getProducts() async {
    final url = AppUrl.baseUrl;

    try {
      final request = await http.get(
        Uri.parse(url),
      );
      debugPrint(request.statusCode.toString());

      if (request.statusCode >= 400) {
        throw Exception(
            'Failed to fetch products.The issue is from us, will fix it soon.');
      }

      if (request.statusCode == 200) {
        if (json.decode(request.body)['items'] == null) {
          return ProductModel();
        } else {
          final productModel = productModelFromJson(request.body);
          return productModel;
        }
      } else {
        throw HttpException('Unexpected status code: ${request.statusCode}');
      }
    } on SocketException catch (_) {
      throw HttpException(
          'No Internet connection. Please check your network settings and try again.');
    } catch (e) {
      debugPrint('Error fetching products: $e');
      rethrow;
    }
  }
}

class HttpException implements Exception {
  final String message;
  HttpException(this.message);

  @override
  String toString() => message;
}
