import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'category.dart';

class CategoryCard extends StatelessWidget {
  late Category category;
  Function onCardClick;
  CategoryCard({required this.category, required this.onCardClick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick();
      },
      child: Container(
        margin: EdgeInsets.all(20),
        height: 150,
        child: Stack(children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                "img/" + category.imgName!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent
                      ])),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 135,
                    height: 150,
                  ),
                  Text(
                    this.category.name!,
                    style: GoogleFonts.mansalva(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 46,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 224, 224, 224),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
