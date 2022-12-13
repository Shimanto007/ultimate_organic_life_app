import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {

  final String product_name;

  ProductItem(this.product_name);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Text(product_name),
    );
  }
}
