import 'package:dio/dio.dart';

import '../../features/home/Model/ProductModel.dart';
import 'Error.dart';



class HomeService {
  final Dio dio;

  HomeService(this.dio);

  Future<List<String>?> getAllCategories() async {
    try {
      final response = await dio.get('/products/categories');

      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      } else {
        throw Exception("Failed to load categories");
      }
    } on DioException catch (e) {
      throw handleDioError(e);

    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }


  Future<List<Product>> getProductsByCategory(String categoryName) async {
    try {
      final response = await dio.get('/products/category/$categoryName');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        throw Exception("Failed to load products for category: $categoryName");
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }


}
