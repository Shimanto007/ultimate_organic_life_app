import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'category_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:convert/convert.dart';
// import './category_api.dart';


class CategoriesScreen extends StatefulWidget {

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
    var data;
    var hall;
    var index=0;
    var category_list =[];

  Future getData() async {
    var response = await http.get(Uri.parse('https://ultimateapi.hostprohub.com/api/get-categories'));
    setState(() {
      var decode = jsonDecode(response.body);

      data = decode["categories"][0]["categories"].length;

      for(var i =0; i<data; i++) {
        category_list.add(decode["categories"][0]["categories"][i]["category_name"]);
      }
      print(category_list.map((item) => CategoryItem(item)).toList());
      print(category_list);

      // print(data);
      // print(data);
      // print(DUMMY_CATEGORIES);
      // hall = DUMMY_CATEGORIES
      //     .map((catData) => CategoryItem(catData.id, catData.title),
      // ).toList();
      // print(hall);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: GridView.count(
        primary: false,
        shrinkWrap:true,
        crossAxisCount: 4,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: category_list.map((item) => CategoryItem(item)).toList(),
      ),
    );
  }
}
