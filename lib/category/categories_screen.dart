import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'category_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import'../models/products.dart';
// import 'package:convert/convert.dart';
import './category_api.dart';


class CategoriesScreen extends StatefulWidget {

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
    var data;
    var hall;
    var index;
    var category_list =[];
    var product_list = [];
    var id_list =[];
    var list =[];
    var listEncode;
    var result;
    var categorylist;
    var arrr = [];

  // Future getData() async {
  //   var response = await http.get(Uri.parse('https://ultimateapi.hostprohub.com/api/get-categories'));
  //   setState(() {
  //
  //     var cates = welcomeFromMap(response.body);
  //     print(cates);
  //
  //     var decode = jsonDecode(response.body);
  //
  //
  //     data = decode["categories"][0]["categories"].length;
  //     hall = decode["categories"][0]["categories"];
  //     index = jsonEncode(hall);
  //     // print(index);
  //
  //
  //
  //     for(var i =0; i<data; i++) {
  //       category_list.add(decode["categories"][0]["categories"][i]["category_name"]);
  //     }
  //     print(category_list);
  //     for(var i =0; i<data; i++) {
  //       list.add(decode["categories"][0]["categories"][i]["id"]);
  //     }
  //     print(list);
  //
  //
  //
  //     // print(listEncode);
  //     // print(list);
  //     // print(result);
  //
  //   });
  // }
Future<UserModel> getCategoryApi() async {
    final response = await http.get(
      Uri.parse('https://webhook.site/126209de-e698-4fd1-a55e-a03c3f18fccf'),
    );
    var data = jsonDecode(response.body.toString());
    print(data);
    if (response.statusCode == 200) {
      return UserModel.fromJson(data);
    } else {
      return UserModel.fromJson(data);
    }
  }


  @override
  void initState() {
  getCategoryApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<UserModel>(
                future: getCategoryApi(),
                builder: (context, snapshot) {
                   if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return ListView.builder(
                        itemCount: snapshot.data!.data![index].products!.length,
                        itemBuilder: (context, position) {
                          return Text(snapshot.data!.data![index].products![position].title.toString());
                        });
                        });
                  } else {
                    return Text("loading");
                  }
                },
              ),
    );
    //   SizedBox(
    //   height: 220,
    //   child:
    //   // GridView.count(
    //   //   primary: false,
    //   //   shrinkWrap:true,
    //   //   crossAxisCount: 4,
    //   //   padding: const EdgeInsets.all(5),
    //   //   crossAxisSpacing: 5,
    //   //   mainAxisSpacing: 5,
    //   //   children: category_list.map((item) => CategoryItem(item)).toList(),
    //   // ),
    // );
  }
}
