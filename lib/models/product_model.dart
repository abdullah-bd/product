import 'package:flutter/cupertino.dart';

class Product{
  int? id;
  String? name;
  String? category;
  String? description;
  double? price;
  bool? isFavourite;
  String? uploadDate;
  double rating = 0.0;
  String? image;

  Product();

  @override
  String toString() {
    return 'Product{id: $id, name: $name, category: $category, description: $description, price: $price, isFavourite: $isFavourite, uploadDate: $uploadDate, rating: $rating, image: $image}';
  }
}