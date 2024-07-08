import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_product_services.dart';

class ProductProvider with ChangeNotifier {
  ProductModel? _productModel;
  bool _isLoading = false;
  String? _errorMessage;

  ProductModel? get productModel => _productModel;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _productModel = await GetProductServices().getProducts();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
