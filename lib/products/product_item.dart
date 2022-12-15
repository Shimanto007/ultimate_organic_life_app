import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final dynamic id;
  final dynamic product_name;

  ProductItem(this.id, this.product_name);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridTile(
        child: Center(child: Text(product_name)),
      ),
    );
  }
}
