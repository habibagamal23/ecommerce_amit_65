import 'package:ecommerce65/core/utils/colors.dart';
import 'package:ecommerce65/core/utils/spacing.dart';
import 'package:ecommerce65/features/home/ui/widgets/HomeTopBar.dart';
import 'package:ecommerce65/features/home/ui/widgets/category_list/CategoryListview.dart';
import 'package:ecommerce65/features/home/ui/widgets/container_view_all.dart';
import 'package:ecommerce65/features/home/ui/widgets/crouselSlider.dart';
import 'package:ecommerce65/features/home/ui/widgets/product_list/product_list_view.dart';
import 'package:ecommerce65/features/home/ui/widgets/searchbar.dart';
import 'package:ecommerce65/features/home/ui/widgets/titlewith_icon_sort.dart';
import 'package:flutter/material.dart';


class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              verticalSpace(20),
              const HomeTopBar(),
              verticalSpace(20),
              const Searchbar(),
              verticalSpace(10),
              TitleWithActions(
                title: 'All Featured',
                onSortPressed: () {},
                onFilterPressed: () {},
              ),
              verticalSpace(10),
              const CategoryListView(),
              verticalSpace(10),
              PromotionalCarousel(
              ),
              verticalSpace(10),
              ContainerViewAll(
                title: 'Deal Of the day ',
                subtitle: '22/0/20',
                buttonText: 'View all ',
                backgroundColor:
                ColorsManager.mainBlue,
                icon: Icons.timer,
                onButtonPressed: () {  },),
              ProductListView(),


          
            ],
          ),
        ),
      ),
    );
  }
}
