import 'package:flutter/material.dart';
import 'package:product_useing_api/models/product_model.dart';
import 'package:product_useing_api/services/product_service.dart';

class ProductController extends ChangeNotifier {
  final ProductService _productService = ProductService();
  final List<ProductModel> _products = [];
  final Set<int> _cartIds = {};
  bool isLoading = false;
  String? errorMessage;

  List<ProductModel> get products => _products;
  String? get error => errorMessage;

  Future<void> fetchProducts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();
    try {
      _products.clear();
      final fetched = await _productService.fetchProducts();
      for (final p in fetched) {
        if (_cartIds.contains(p.id)) {
          p.isAdded = true;
        }
      }
      _products.addAll(fetched);
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  void addProduct(ProductModel product) {
    if (product.isAdded) return;
    product.isAdded = true;
    _cartIds.add(product.id);
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    if (!product.isAdded) return;
    product.isAdded = false;
    _cartIds.remove(product.id);
    notifyListeners();
  }
}
