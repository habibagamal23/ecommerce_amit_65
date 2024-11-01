
import 'package:ecommerce65/features/home/ui/widgets/product_list/productitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../logic/home_cubit.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 8.sp ),
      child: SizedBox(
        height: 350,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoaded) {
              final products = state.products.take(3).toList(); // Limit to 3 items
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              );
            } else if (state is ProductsError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('No products available'));
            }
          },
        ),
      ),
    );
  }
}