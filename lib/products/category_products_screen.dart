import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../products/product_item.dart';
import '../models/category_product.dart';

class CategoryProductsScreen extends StatefulWidget {
  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  var data;
  var product_list = [];
  var loadedProducts = [];
  var products_map;
  var ant;
  var ant1;
  var response;

  Future<CategoryProduct> getCategoryApi() async {
    response = await http.get(
      Uri.parse('https://ultimateapi.hostprohub.com/api/get-products'),
    );
    var data = jsonDecode(response.body.toString());
    final cat = jsonDecode(response.body.toString())["products"];
    // final list =  cat.map((json) => CategoryProduct.fromJson(json)).toList();
    print(cat);
    // ant1 = jsonDecode(response.body);
    // ant = ant1["products"][0];
    // print(ant);
    if (response.statusCode == 200) {
      return CategoryProduct.fromJson(data);
    } else {
      return CategoryProduct.fromJson(data);
    }
  }


  @override
  void initState() {
    super.initState();
    this.getCategoryApi();

  }

  // final String item;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoriesTitle = routeArgs['title'];
    final categoriesId = routeArgs['id'];

    // final categoriesProduct = cat.where((product) {
    //   return product.category_id.contains(categoriesId);
    // }).toList();
    double height = MediaQuery.of(context).size.height;
    print(routeArgs);
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        leading: const BackButton(
          color: Color(0xFF0098B8),
        ),
        title: Text(
          categoriesTitle,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          height: height,
          child: FutureBuilder<CategoryProduct>(
            future: getCategoryApi(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                    ),
                    itemCount: snapshot.data!.products.length,
                    itemBuilder: (context, i) => ProductItem(
                      snapshot.data!.products[i]!.id,
                      snapshot.data!.products![i].productName,
                    ),
                  ),
                );
              } else {
                return Text("loading");
              }
            },
          ),
        ),
      ),
    );
  }
}
