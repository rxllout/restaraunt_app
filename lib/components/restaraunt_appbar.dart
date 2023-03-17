import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

SliverAppBar RestarauntAppBar() {
  return SliverAppBar(
    pinned: true,
    elevation: 0,
    backgroundColor: kConstantColourNavy,
    expandedHeight: 200,
    flexibleSpace: FlexibleSpaceBar(
      background: Image.asset(
        'assets/images/food.jpg',
        fit: BoxFit.cover,
      ),
    ),
    leading: Padding(
      padding: const EdgeInsets.only(left: 16),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: kConstantColourNavy,
        child: SvgPicture.asset(
          "assets/icons/back.svg",
          color: kConstantColourWhite,
        ),
      ),
    ),
    actions: [
      CircleAvatar(
        radius: 20,
        backgroundColor: kConstantColourNavy,
        child: SvgPicture.asset(
          "assets/icons/share.svg",
          color: kConstantColourWhite,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: kConstantColourNavy,
          child: SvgPicture.asset(
            "assets/icons/search.svg",
            color: kConstantColourWhite,
          ),
        ),
      ),
    ],
  );
}
