import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../features/home/Model/CategoryModel.dart';
import '../../features/home/Model/ProductModel.dart';
import 'Error.dart';

class HomeService {
  final Dio dio;

  HomeService(this.dio);

  // Future<CategoriesResponse?> getAllCategories() async {
  //   try {
  //     final response = await dio.get('/products/categories');
  //
  //     if (response.statusCode == 200) {
  //       return CategoriesResponse.fromJson(response.data);
  //     } else {
  //       throw Exception("Failed to load categories");
  //     }
  //   } on DioException catch (e) {
  //     throw handleDioError(e);
  //     // if (e.type == DioExceptionType.connectionError) {
  //     //   throw Exception("Connection error: ${e.message}");
  //     // } else if (e.type == DioExceptionType.badResponse) {
  //     //   throw Exception("Invalid response: ${e.response?.data}");
  //     // } else {
  //     //   throw Exception("Load error: ${e.message}");
  //     // }
  //   } catch (e) {
  //     throw Exception("Unexpected error: $e");
  //   }
  // }

  Future<List<Product>> fetchProducts({int limit = 3}) async {
    try {
      final response = await dio.get('/products',
          queryParameters: {
        'limit': limit,
      });
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => Product.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load products');
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


  Future<Product> fetchSingleProduct(int id) async {
    try {
      final response = await dio.get('/products/$id');
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        throw Exception('Failed to load product');
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
