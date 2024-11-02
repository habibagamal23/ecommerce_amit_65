import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/networks/home_service.dart';
import '../Model/ProductModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeService _homeService;

  HomeCubit(this._homeService) : super(HomeInitial()) {
    _loadCategories();
  }
  late final categories;
  Future<void> _loadCategories() async {
    try {
      emit(HomeLoading());

      // Fetch categories
       categories = await _homeService.getAllCategories();

      if (categories != null && categories.isNotEmpty) {
        final firstCategory = categories.first;

        final products =
            await _homeService.getProductsByCategory(firstCategory);

        emit(HomeLoaded(
          categories: categories,
          products: products,
          selectedCategory: firstCategory,
        ));
      } else {
        emit(CategoriesError("No categories found"));
      }
    } catch (e) {
      emit(CategoriesError("Failed to load categories: $e"));
    }
  }
  Future<void> selectCategory(String selectedCategory) async {
    try {
      final currentState = state;
      List<String> categories = [];

      if (currentState is HomeLoaded) {
        categories = currentState.categories;
      }
      emit(HomeLoading());

      final products = await _homeService.getProductsByCategory(selectedCategory);
      emit(HomeLoaded(
        categories: categories,
        products: products,
        selectedCategory: selectedCategory,
      ));
    } catch (e) {
      emit(CategoriesError("Failed to load products for $selectedCategory: $e"));
    }
  }

}
