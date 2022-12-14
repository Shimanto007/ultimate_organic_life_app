import 'package:flutter/material.dart';
import '../products/category_products_screen.dart';

class CategoryItem extends StatelessWidget {
  final String item;



  CategoryItem(this.item);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      '/category-product',
      arguments: {'title': item,},
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: const Color(0xFF63af40),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFF0098B8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            item,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
