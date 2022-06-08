import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ScrollBar/categorycard.dart';
import '../misc/colors.dart';
import '../widgets/App_GoogleFonts1.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';
import 'ScrollMenu.dart';

int i = 0;

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<WelcomePage> {
  List images = [
    "final4.png",
    "final1 (1) (2).png",
    "final3.png",
  ];
  List text1 = [
    "Hey there!",
    "Are you tired,\ndo you want to hear\nsome things? 0-)",
    "\n\n\n\nCreated by"
  ];
  List text2 = ["We are Math Universe", "", ""];
  List text3 = ["Click the button\nbellow and take-off!", "", ""];
  List textsForSpaceMan = [
    "Choose your figure, give us\nthe parameters and we\nwill do the dirty work!",
    "What did the triangle say to\nthe circle?\nYou are pointless.\nVery funny...",
    "I'm here to waste your time!",
    "Is there really\nnothing else to do?",
    "Choose your figure, give us\nthe parameters and we will do\nthe dirty work!",
    "I'm waiting for the version in\nwhich we will be able\nto chat ...",
    "By the way, those who put\nme here know nothing\nabout programming.",
    "I think that they added\na game in the next page,\nbut I am not sure..."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/" + images[index]),
                        fit: BoxFit.cover)),
                child: Container(
                    margin:
                        const EdgeInsets.only(top: 100, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              text1[index],
                              style: GoogleFonts.aBeeZee(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 204, 222, 255),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              text2[index],
                              style: GoogleFonts.aBeeZee(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 88, 245, 237),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            if (index == 1) ...[
                              SizedBox(
                                height: 50,
                                width: 120,
                              ),
                            ],
                            if (index == 1) ...[
                              GestureDetector(
                                onTap: () {
                                  i++;
                                  if (i >= 8) {
                                    i = 0;
                                  }
                                  setState(() {
                                    textsForSpaceMan[i];
                                  });
                                },
                                child: Center(
                                  child: Text(
                                    textsForSpaceMan[i],
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 27,
                                        color:
                                            Color.fromARGB(255, 165, 219, 255),
                                        background: Paint()
                                          ..strokeWidth = 60.0
                                          ..color =
                                              Color.fromARGB(255, 14, 10, 63)
                                          ..style = PaintingStyle.stroke
                                          ..strokeJoin = StrokeJoin.round),
                                  ),
                                ),
                              ),
                            ],
                            Text(
                              text3[index],
                              style: GoogleFonts.aBeeZee(
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(255, 88, 201, 245),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            if (index == 0) ...[
                              GestureDetector(
                                onTap: () {
                                  //CategoryListPage()
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CategoryListPage()));
                                },
                                child: Container(
                                  width: 200,
                                  child: Row(
                                    children: [
                                      ResponsiveButton(
                                        width: 120,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ],
                        ),
                        Column(
                          children: List.generate(3, (indexDots) {
                            return Center(
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                width: 8,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: index == indexDots
                                        ? AppColors.mainColor
                                        : AppColors.mainColor.withOpacity(0.3)),
                              ),
                            );
                          }),
                        )
                      ],
                    )));
          }),
    );
  }
}
