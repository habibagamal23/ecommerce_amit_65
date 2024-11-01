part of 'prudct_cubit.dart';

@immutable
sealed class PrudctState {}

final class PrudctInitial extends PrudctState {}
class ProductsLoading extends PrudctState {}
class ProductsLoaded extends PrudctState {
  final List<Product> products;
  ProductsLoaded(this.products);
}
class ProductsError extends PrudctState {
  final String message;
  ProductsError(this.message);
}
