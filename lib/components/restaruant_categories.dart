import 'package:flutter/material.dart';
import 'package:restaraunt_app/constants.dart';
import '../models/menu.dart';

class RestaurantCategories extends SliverPersistentHeaderDelegate {
  final ValueChanged<int> onChanged;
  final int selectedIndex;

  RestaurantCategories({required this.onChanged, required this.selectedIndex});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kConstantColourNavy,
      height: 53,
      child: Categories(
        onChanged: onChanged,
        selectedIndex: selectedIndex,
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 52;

  @override
  // TODO: implement minExtent
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required this.onChanged,
    required this.selectedIndex,
  }) : super(key: key);

  final ValueChanged<int> onChanged;
  final int selectedIndex;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // int selectedIndex = 0;
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Categories oldWidget) {
    _controller.animateTo(
      80.0 * widget.selectedIndex,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 200),
    );
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          demoCategoryMenus.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 8),
            child: TextButton(
              onPressed: () {
                widget.onChanged(index);
                // _controller.animateTo(
                //   80.0 * index,
                //   curve: Curves.ease,
                //   duration: const Duration(milliseconds: 200),
                // );
              },
              style: TextButton.styleFrom(
                  foregroundColor: widget.selectedIndex == index
                      ? kConstantColourWhite
                      : Colors.white70),
              child: Text(
                demoCategoryMenus[index].category,
                style: const TextStyle(
                  fontSize: 20,
                  color: kConstantColourWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
