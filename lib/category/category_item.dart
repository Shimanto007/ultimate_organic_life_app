import 'package:flutter/material.dart';
import '../products/category_products_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;

  CategoryItem(this.id, this.title);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CategoryProductsScreen(id, title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Color(0xFF63af40),
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.all(5),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Lato',
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Color(0xFF0098B8),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
