import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../core/networks/home_service.dart';
import '../home/Model/ProductModel.dart';

part 'prudct_state.dart';

class PrudctCubit extends Cubit<PrudctState> {
  final HomeService _homeService;
  PrudctCubit(this._homeService) : super(PrudctInitial());


  Future<void> fetchProductsbyCagegory(String categoryName) async {
    emit(ProductsLoading());
    try {
      final products = await _homeService.getProductsByCategory(categoryName);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }

}
