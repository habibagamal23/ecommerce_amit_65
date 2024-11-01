import '../../../generated/assets.dart';

class CategoryModel {
  final String nameCategory;
  final String imageCategory;

  CategoryModel({required this.nameCategory, required this.imageCategory});
}

List<CategoryModel> get categories => [
      CategoryModel(
          nameCategory: "electronics", imageCategory: Assets.imagesElectronics),
      CategoryModel(
          nameCategory: "jewelery", imageCategory: Assets.imagesJelwry),
      CategoryModel(
          nameCategory: "men's clothing", imageCategory: Assets.imagesMens),
      CategoryModel(
          nameCategory: "women's clothing", imageCategory: Assets.imagesWomen),
    ];
