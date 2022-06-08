import 'package:flutter/material.dart';
import 'package:flutter_application_3/misc/colors.dart';
import 'package:flutter_application_3/ScrollBar/category.dart';
import 'package:flutter_application_3/ScrollBar/selectedcategorypage.dart';
import 'package:flutter_application_3/ScrollBar/INFORMATIONforScroll.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../ScrollBar/categorycard.dart';
import '../widgets/responsive_button.dart';
import 'Welcome_page.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(0, 43, 6, 128),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // GestureDetector(
            //   onTap: () {
            //     //CategoryListPage()
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => WelcomePage()));
            //   },
            //   child: Container(
            //     width: 200,
            //     child: Row(
            //       children: [
            //         ResponsiveButton(
            //           width: 60,
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 45, bottom: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 43, 6, 128).withOpacity(0.0),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Pick a figure",
                    style: GoogleFonts.megrim(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 55,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(10.0, 15.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 52, 29, 54),
                        )
                      ],
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 232, 128, 241),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return CategoryCard(
                    category: categories[index],
                    onCardClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectedCategoryPage(
                                    selectedCategory:
                                        Utils.getMockedCategories()[index],
                                  )));
                    });
              },
            )),
          ],
        )));
  }
}
