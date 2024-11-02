part of 'home_cubit.dart';

@immutable
sealed class HomeState {}
final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<String> categories;
  final List<Product> products;
  final String selectedCategory;

  HomeLoaded({
    required this.categories,
    required this.products,
    required this.selectedCategory,
  });
}

class CategoriesError extends HomeState {
  final String message;
  CategoriesError(this.message);
}