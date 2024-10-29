import 'package:flutter/material.dart';

class ItemCategories {
  final String id;
  final String name;
  final int color;

  ItemCategories(this.id, this.name, this.color);
}

class CategoryProvider with ChangeNotifier {
  final List<ItemCategories> _categories = [
    ItemCategories('c1', 'Italian', 0xfff5428d),
    ItemCategories('c2', 'Quick & Easy', 0xfff54242),
    ItemCategories('c3', 'Hamburgers', 0xfff5a442),
    ItemCategories('c4', 'German', 0xfff5d142),
    ItemCategories('c5', 'Light & Lovely', 0xff368dff),
    ItemCategories('c6', 'Exotic', 0xff41d95d),
    ItemCategories('c7', 'Breakfast', 0xff9eecff),
    ItemCategories('c8', 'Asian', 0xffb9ffb0),
    ItemCategories('c9', 'French', 0xffffc7ff),
    ItemCategories('c10', 'Summer', 0xff47fced),
  ];

  List<ItemCategories> get categories => _categories;
}