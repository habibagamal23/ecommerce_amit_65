import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce65/core/utils/spacing.dart';
import 'package:ecommerce65/features/home/logic/home_cubit.dart';
import 'package:ecommerce65/features/home/ui/widgets/category_list/categorylistview.dart';
import 'package:ecommerce65/features/home/ui/widgets/crouselSlider.dart';
import 'package:ecommerce65/features/home/ui/widgets/product_list/ProductListHorizontal.dart';
import 'package:ecommerce65/features/home/ui/widgets/HomeTopBar.dart';
import 'package:ecommerce65/features/home/ui/widgets/searchbar.dart';
import 'package:ecommerce65/features/home/ui/widgets/titlewith_icon_sort.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/locale_keys.g.dart';
import '../../productsscreen/productscreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(30),
              HomeTopBar(),
              verticalSpace(30),
              Searchbar(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TitleWithActions(
                  title: LocaleKeys.homepage_all_featured.tr(),
                  onSortPressed: () {},
                  onFilterPressed: () {},
                ),
              ),

              CategoryList(),
              ProductListHorizontal(),

              // Wrap CategoryList in SliverToBoxAdapter
            ],
          ),
        ),
      ),
    );
  }
}
