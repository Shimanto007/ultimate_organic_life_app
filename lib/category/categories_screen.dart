import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.count(
        primary: false,
        shrinkWrap:true,
        crossAxisCount: 4,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(catData.id, catData.title),
        ).toList(),
      ),
    );
  }
}
