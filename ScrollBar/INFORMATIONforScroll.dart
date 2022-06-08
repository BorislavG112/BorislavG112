import 'package:flutter/material.dart';
import 'package:flutter_application_3/ScrollSub/subcategory.dart';
import 'category.dart';

class Utils {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();

  static List<Category> getMockedCategories() {
    return [
      Category(
          color: Colors.yellow,
          name: "Square",
          imgName:
              "flowing-art-flux-square-drop-leak-abstract-design-vector-13561721.png",
          subCategories: [
            SubCategory(
                name: "Cerdo",
                color: Colors.black,
                imgName:
                    "flowing-art-flux-square-drop-leak-abstract-design-vector-13561721.png")
          ]),
      Category(
          color: Colors.yellow,
          name: "Rectangle",
          imgName:
              "flowing-art-flux-square-drop-leak-abstract-design-vector-13561722.png",
          subCategories: []),
      Category(
          color: Colors.yellow,
          name: "Trapezoid",
          imgName:
              "flowing-art-flux-square-drop-leak-abstract-design-vector-13561723.png",
          subCategories: [
            SubCategory(
                name: "vygbhnjk",
                color: Colors.black,
                imgName:
                    "flowing-art-flux-square-drop-leak-abstract-design-vector-13561721.png")
          ]),
      Category(
          color: Colors.yellow,
          name: " Circle",
          imgName:
              "flowing-art-flux-square-drop-leak-abstract-design-vector-135617211.png",
          subCategories: []),
      Category(
          color: Colors.yellow,
          name: "Hyperbola",
          imgName:
              "flowing-art-flux-square-drop-leak-abstract-design-vector-13561721.png",
          subCategories: []),
      Category(
          color: Colors.yellow,
          name: "Parabola ",
          imgName:
              "flowing-art-flux-square-drop-leak-abstract-design-vector-13561721.png",
          subCategories: []),
      Category(
          color: Colors.yellow,
          name: "Ellipse",
          imgName:
              "flowing-art-flux-square-drop-leak-abstract-design-vector-13561721.png",
          subCategories: []),
      // Category(
      //     color: Colors.yellow,
      //     name: "Sixth",
      //     imgName:
      //         "flowing-art-flux-square-drop-leak-abstract-design-vector-13561721.png",
      //     subCategories: []),
      // Category(
      //     color: Colors.yellow,
      //     name: "Sixth",
      //     imgName:
      //         "flowing-art-flux-square-drop-leak-abstract-design-vector-13561721.png",
      //     subCategories: []),
    ];
  }
}
