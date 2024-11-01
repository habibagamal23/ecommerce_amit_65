part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

// Products states
class ProductsLoading extends HomeState {}
class ProductsLoaded extends HomeState {
  final List<Product> products;
  ProductsLoaded(this.products);
}
class ProductsError extends HomeState {
  final String message;
  ProductsError(this.message);
}

// Single Product states
class SingleProductLoading extends HomeState {}
class SingleProductLoaded extends HomeState {
  final Product product;
  SingleProductLoaded(this.product);
}
class SingleProductError extends HomeState {
  final String message;
  SingleProductError(this.message);
}
