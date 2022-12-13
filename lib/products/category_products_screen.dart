import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../products/product_item.dart';

class CategoryProductsScreen extends StatefulWidget {
  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  var data;
  var product_list =[];
  var loadedProducts = [];
  var products_map;

  Future getDatas() async {
    var response = await http.get(Uri.parse('https://ultimateapi.hostprohub.com/api/get-products'));
    setState(() {
      var decode = jsonDecode(response.body);
      data = decode["products"].length;
      print(data);

      for(var i =0; i<data; i++) {
        product_list.add(decode["products"][i]["category"]["category_name"]);
      }
      for(var i =0; i<data; i++) {
        loadedProducts.add(decode["products"][i]["product_name"]);
      }
      products_map = loadedProducts.map((item) => ProductItem(item));
      // print(loadedProducts);


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
    this.getDatas();
  }

  // final String item;
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    print(routeArgs);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        leading: const BackButton(
          color: Color(0xFF0098B8),
        ),
        title: Text(
          categoryTitle,
          style: TextStyle(
            fontFamily: 'Lato',
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Color(0xFF0098B8),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body:
      GridView.count(
        primary: false,
        shrinkWrap:true,
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        children: loadedProducts.map((item) => ProductItem(item)).toList(),
      ),
    );
  }
}
