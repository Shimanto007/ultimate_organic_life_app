// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


Welcome welcomeFromMap(String str) => Welcome.fromMap(json.decode(str));

String welcomeToMap(Welcome data) => json.encode(data.toMap());

class Welcome {
  Welcome({
    required this.categories,
  });

  final List<WelcomeCategory> categories;

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
    categories: List<WelcomeCategory>.from(json["categories"].map((x) => WelcomeCategory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
  };
}

class WelcomeCategory {
  WelcomeCategory({
    required this.id,
    required this.name,
    required this.categories,
  });

  final int id;
  final String name;
  final List<CategoryCategory> categories;

  factory WelcomeCategory.fromMap(Map<String, dynamic> json) => WelcomeCategory(
    id: json["id"],
    name: json["name"],
    categories: List<CategoryCategory>.from(json["categories"].map((x) => CategoryCategory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
  };
}

class CategoryCategory {
  CategoryCategory({
    required this.id,
    required this.sectionId,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryDiscount,
    required this.url,
    required this.categoryBgColor,
    required this.subcategories,
  });

  final int id;
  final int sectionId;
  final String categoryName;
  final String categoryImage;
  final int categoryDiscount;
  final String url;
  final dynamic categoryBgColor;
  final List<Subcategory> subcategories;

  factory CategoryCategory.fromMap(Map<String, dynamic> json) => CategoryCategory(
    id: json["id"],
    sectionId: json["section_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    categoryDiscount: json["category_discount"],
    url: json["url"],
    categoryBgColor: json["category_bg_color"],
    subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "section_id": sectionId,
    "category_name": categoryName,
    "category_image": categoryImage,
    "category_discount": categoryDiscount,
    "url": url,
    "category_bg_color": categoryBgColor,
    "subcategories": List<dynamic>.from(subcategories.map((x) => x.toMap())),
  };
}

class Subcategory {
  Subcategory({
    required this.id,
    required this.parentId,
    required this.sectionId,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryDiscount,
    required this.description,
    required this.url,
    required this.categoryBgColor,
    required this.metaTitle,
    required this.metaDescription,
    required this.metaKeywords,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int parentId;
  final int sectionId;
  final String categoryName;
  final String categoryImage;
  final int categoryDiscount;
  final String description;
  final String url;
  final dynamic categoryBgColor;
  final String metaTitle;
  final String metaDescription;
  final String metaKeywords;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Subcategory.fromMap(Map<String, dynamic> json) => Subcategory(
    id: json["id"],
    parentId: json["parent_id"],
    sectionId: json["section_id"],
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    categoryDiscount: json["category_discount"],
    description: json["description"],
    url: json["url"],
    categoryBgColor: json["category_bg_color"],
    metaTitle: json["meta_title"] == null ? null : json["meta_title"],
    metaDescription: json["meta_description"] == null ? null : json["meta_description"],
    metaKeywords: json["meta_keywords"] == null ? null : json["meta_keywords"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "parent_id": parentId,
    "section_id": sectionId,
    "category_name": categoryName,
    "category_image": categoryImage,
    "category_discount": categoryDiscount,
    "description": description,
    "url": url,
    "category_bg_color": categoryBgColor,
    "meta_title": metaTitle == null ? null : metaTitle,
    "meta_description": metaDescription == null ? null : metaDescription,
    "meta_keywords": metaKeywords == null ? null : metaKeywords,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
