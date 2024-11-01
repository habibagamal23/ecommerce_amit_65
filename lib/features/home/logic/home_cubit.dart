import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/networks/home_service.dart';
import '../Model/CategoryModel.dart';
import '../Model/ProductModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;
  HomeCubit(this._homeService) : super(HomeInitial()) {
    fetchProducts();
  }

  // Fetch all products
  Future<void> fetchProducts() async {
    emit(ProductsLoading());
    try {
      final products = await _homeService.fetchProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }


  // Fetch a single product
  Future<void> fetchSingleProduct(int id) async {
    emit(SingleProductLoading());
    try {
      final product = await _homeService.fetchSingleProduct(id);
      emit(SingleProductLoaded(product));
    } catch (e) {
      emit(SingleProductError(e.toString()));
    }
  }
}
