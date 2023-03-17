import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaraunt_app/components/menu_card.dart';
import 'package:restaraunt_app/components/restaruant_categories.dart';
import 'package:restaraunt_app/models/menu.dart';
import 'components/restaraunt_appbar.dart';
import 'constants.dart';
import '/components/restaurant_info.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  final scrollController = ScrollController();
  int selectedCategoryIndex = 0;
  double restaurantInfoHeight = 200 + 170 - kToolbarHeight;

  @override
  void initState() {
    createBreakPoints();
    scrollController.addListener(() {
      updateCategoryIndexOnScroll(scrollController.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void scrollToCategory(int index) {
    if (selectedCategoryIndex != index) {
      int totalItems = 0;

      for (var i = 0; i < index; i++) {
        totalItems += demoCategoryMenus[i].items.length;
      }
      scrollController.animateTo(
        //116 = 100 Menu Item Height + 16 Padding on each item//
        // 50 = 18 Title Font Size + 32 (16 vertical padding on title)
        restaurantInfoHeight + (116 * totalItems) + (50 * index),
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      setState(() {
        selectedCategoryIndex = index;
      });
    }
  }

  List<double> breakPoints = [];

  void createBreakPoints() {
    double firstBreakPoint =
        restaurantInfoHeight + 50 + (116 * demoCategoryMenus[0].items.length);
    breakPoints.add(firstBreakPoint);

    for (var i = 1; i < demoCategoryMenus.length; i++) {
      double breakPoint =
          breakPoints.last + 50 + (116 * demoCategoryMenus[i].items.length);
      breakPoints.add(breakPoint);
    }
  }

  void updateCategoryIndexOnScroll(double offset) {
    for (var i = 0; i < demoCategoryMenus.length; i++) {
      if (i == 0) {
        if ((offset < breakPoints.first) & (selectedCategoryIndex != 0)) {
          setState(() {
            selectedCategoryIndex = 0;
          });
        } else if ((breakPoints[i - 1] <= offset) & (offset < breakPoints[i])) {
          if (selectedCategoryIndex != i) {
            setState(() {
              selectedCategoryIndex = i;
            });

            Widget build(BuildContext context) {
              return Scaffold(
                backgroundColor: kConstantColourNavy,
                body: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    RestarauntAppBar(),
                    const SliverToBoxAdapter(
                      child: RestaurantInfo(),
                    ),
                    SliverPersistentHeader(
                      delegate: RestaurantCategories(
                          onChanged: scrollToCategory,
                          selectedIndex: selectedCategoryIndex),
                      pinned: true,
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                            (context, categoryIndex) {
                          return MenuCategoryItem(
                            title: demoCategoryMenus[categoryIndex].category,
                            items: demoCategoryMenus[categoryIndex].items,
                          );
                        }, childCount: demoCategoryMenus.length),
                      ),
                    ),
                  ],
                ),
              );
            }
          }
        }
      }
    }
  }
}
