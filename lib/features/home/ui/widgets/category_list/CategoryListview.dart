import 'package:ecommerce65/core/routs/approuter.dart';
import 'package:ecommerce65/core/utils/extention.dart';
import 'package:ecommerce65/features/home/logic/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/di/di.dart';
import '../../../../../core/routs/routs.dart';
import '../../../../productsscreen/prudct_cubit.dart';
import '../../../Model/CategoryModel.dart';
import 'HomeCategoryCard.dart';
class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      margin: EdgeInsets.only(left: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              // Use the PrudctCubit provided above
              context.read<PrudctCubit>().fetchProductsbyCagegory(category.nameCategory);
              context.pushNamed(Routes.productDtailes);
            },
            child: HomeCategory(
              categoryModel: category,
            ),
          );
        },
      ),
    );
  }
}