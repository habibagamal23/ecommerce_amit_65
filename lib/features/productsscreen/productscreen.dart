import 'package:ecommerce65/features/productsscreen/prudct_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/ui/widgets/product_list/productitem.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shop Now")),
      body: BlocBuilder<PrudctCubit, PrudctState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.65,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Expanded(child: ProductCard(product: product));
              },
            );
          } else if (state is ProductsError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No products available'));
          }
        },
      ),
    );
  }
}
