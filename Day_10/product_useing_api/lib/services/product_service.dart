import 'package:dio/dio.dart';
import 'package:product_useing_api/models/product_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get("https://fakestoreapi.com/products");
      return (response.data as List)
          .map((item) => ProductModel.fromJson(item))
          .toList();
    } catch (e) {
      throw Exception("Error fetching products: $e");
    }
  }
  
}
