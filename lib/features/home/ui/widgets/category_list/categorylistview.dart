import 'package:ecommerce65/core/utils/spacing.dart';
import 'package:ecommerce65/features/home/ui/widgets/category_list/shimmercat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/assets.dart';
import '../../../logic/home_cubit.dart';
import 'HomeCategoryCard.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4, // Show 4 shimmer items
              itemBuilder: (context, index) => const ShimmerLoading(),
            ),
          );
        } else if (state is HomeLoaded) {
          return SizedBox(
            height: 120.h, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                final isSelected = category == state.selectedCategory;
                List<String> ImagesCategory = [
                  Assets.imagesElectronics,
                  Assets.imagesJelwry,
                  Assets.imagesMens,
                  Assets.imagesWomen,
                ];
                return GestureDetector(
                  onTap: () {
                    // Select category and load its products
                    context.read<HomeCubit>().selectCategory(category);
                  },
                  child: HomeCategory(
                    category: category,
                    image: ImagesCategory[index],
                    isSelected: isSelected,
                  ),
                );
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
