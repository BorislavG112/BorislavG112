// import 'package:flutter/material.dart';

// class Category {
//   String name;
//   Color color;
//   String imgName;
//   List<Category> subCategories;

//   Category(
//       {required this.name,
//       required this.color,
//       required this.imgName,
//       required this.subCategories,
//       String? icon});
// }
import 'dart:ui';

import 'package:flutter/material.dart';

class Category {
  String? name;
  String? icon;
  Color? color;
  String? imgName;
  List<Category>? subCategories;

  Category(
      {this.name, this.icon, this.color, this.imgName, this.subCategories});
}
