import 'package:flutter/cupertino.dart';

class Product{
  int id;
  String name;
  String category;
  String description;
  double price;
  bool isFavourite;
  String uploadDate;
  double rating;
  String image;

  Product(this.id,this.name, this.category, this.description, this.price,
      this.isFavourite, this.uploadDate, this.rating, this.image);
}