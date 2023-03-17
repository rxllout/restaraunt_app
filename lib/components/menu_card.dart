import 'package:flutter/material.dart';
import 'package:restaraunt_app/constants.dart';
import '../models/menu.dart';

class MenuCategoryItem extends StatelessWidget {
  const MenuCategoryItem({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final List<Menu> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: kConstantColourWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ...List.generate(
          items.length,
          (index) => MenuCard(
            menu: items[index],
          ),
        )
        // ...items,
      ],
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({
    Key? key,
    required this.menu,
  }) : super(key: key);
  final Menu menu;
  // final String image, title;
  // final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              menu.image,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: DefaultTextStyle(
              style: const TextStyle(color: kConstantColourWhite),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    menu.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: kConstantColourWhite,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      menu.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: kConstantColourWhite,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text("\$\$"),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: CircleAvatar(
                          radius: 2,
                          backgroundColor: kConstantColourWhite,
                        ),
                      ),
                      Text(menu.cuisine),
                      const Spacer(),
                      Text(
                        "USD${menu.price}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: kConstantColourGreen,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
