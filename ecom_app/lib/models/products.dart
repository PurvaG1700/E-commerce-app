import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  Product(
      {@required this.id,
      @required this.description,
      @required this.imageUrl,
      @required this.price,
      @required this.title,
      this.isFavourite = false});
}
