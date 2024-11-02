import 'package:ecommerce65/features/home/ui/widgets/product_list/productshimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/home_cubit.dart';
import 'productitem.dart';
class ProductListHorizontal extends StatelessWidget {
  const ProductListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return SizedBox(
            height: 300, // Set a fixed height for the shimmer loading
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4, // Show 4 shimmer items
              itemBuilder: (context, index) => const ProductShimmerLoading(),
            ),
          );
        } else if (state is CategoriesError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is HomeLoaded) {
          // Show only the first 4 items or fewer if there are less than 4
          final productsToShow = state.products.take(4).toList();

          return SizedBox(
            height: 300, // Set a fixed height for the product card area
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: productsToShow.length,
              itemBuilder: (context, index) {
                final product = productsToShow[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ProductCard(product: product),
                );
              },
            ),
          );
        } else {
          return const Center(
            child: Text("No products available"),
          );
        }
      },
    );
  }
}