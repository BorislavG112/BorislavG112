import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_3/ScrollBar/category.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';

import '../misc/FormulasSquare.dart';

class SelectedCategoryPage extends StatefulWidget {
  late Category selectedCategory;
  SelectedCategoryPage({required this.selectedCategory});

  @override
  State<SelectedCategoryPage> createState() => _SelectedCategoryPageState();
}

Square Square1 = new Square();

class _SelectedCategoryPageState extends State<SelectedCategoryPage> {
  TextEditingController _sizea = new TextEditingController();
  TextEditingController _area = new TextEditingController();
  TextEditingController _perimeter = new TextEditingController();
  TextEditingController _diagonal = new TextEditingController();
  TextEditingController _inredius = new TextEditingController();
  TextEditingController _circumradius = new TextEditingController();

  //const SelectedCategoryPage({Key? key}) : super(key: key);
  num? NEWTEXT = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.selectedCategory.name!, //selectedCategory!.name!,
                  //style: TextStyle(color: Colors.black54, fontSize: 25, )),
                  style: GoogleFonts.aBeeZee(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    color: Color.fromARGB(255, 72, 103, 161),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //Position
            Flexible(
              child: TextField(
                controller: _sizea,
                onChanged: (_sizea) {
                  setState(() {
                    NEWTEXT = int.tryParse(_sizea);
                    NEWTEXT ??= 0;
                    _area.text = Square1.Side(NEWTEXT!)[1].toString();
                    _perimeter.text = Square1.Side(NEWTEXT!)[2].toString();
                    _diagonal.text = Square1.Side(NEWTEXT!)[3].toString();
                    _inredius.text = Square1.Side(NEWTEXT!)[4].toString();
                    _circumradius.text = Square1.Side(NEWTEXT!)[5].toString();
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  prefixText: "a = ",
                  hintText: "side a",
                  hintStyle: TextStyle(
                      fontFamily: "Cairo", fontWeight: FontWeight.bold),
                ),
                maxLength: 18,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Flexible(
              child: TextField(
                controller: _area,
                onChanged: (_area) {
                  setState(() {
                    NEWTEXT = int.tryParse(_area);
                    NEWTEXT ??= 0;
                    _sizea.text = Square1.Area(NEWTEXT!)[0].toString();
                    _perimeter.text = Square1.Area(NEWTEXT!)[2].toString();
                    _diagonal.text = Square1.Area(NEWTEXT!)[3].toString();
                    _inredius.text = Square1.Area(NEWTEXT!)[4].toString();
                    _circumradius.text = Square1.Area(NEWTEXT!)[5].toString();
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  prefixText: "S = ",
                  hintText: "Area",
                  hintStyle: TextStyle(
                      fontFamily: "Cairo", fontWeight: FontWeight.bold),
                ),
                maxLength: 18,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Flexible(
              child: TextField(
                controller: _perimeter,
                onChanged: (_perimeter) {
                  setState(() {
                    NEWTEXT = int.tryParse(_perimeter);
                    NEWTEXT ??= 0;
                    _sizea.text = Square1.Perimeter(NEWTEXT!)[0].toString();
                    _area.text = Square1.Perimeter(NEWTEXT!)[0].toString();
                    //_perimeter.text = Square1.Perimeter(NEWTEXT!)[2].toString();
                    _diagonal.text = Square1.Perimeter(NEWTEXT!)[3].toString();
                    _inredius.text = Square1.Perimeter(NEWTEXT!)[4].toString();
                    _circumradius.text =
                        Square1.Perimeter(NEWTEXT!)[5].toString();
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  prefixText: "P = ",
                  hintText: "Perimeter",
                  hintStyle: TextStyle(
                      fontFamily: "Cairo", fontWeight: FontWeight.bold),
                ),
                maxLength: 18,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Flexible(
              child: TextField(
                controller: _diagonal,
                onChanged: (_diagonal) {
                  setState(() {
                    NEWTEXT = int.tryParse(_diagonal);
                    NEWTEXT ??= 0;
                    _sizea.text = Square1.Diagonal(NEWTEXT!)[0].toString();
                    _area.text = Square1.Diagonal(NEWTEXT!)[0].toString();
                    _perimeter.text = Square1.Diagonal(NEWTEXT!)[2].toString();
                    //_diagonal.text = Square1.Diagonal(NEWTEXT!)[3].toString();
                    _inredius.text = Square1.Diagonal(NEWTEXT!)[4].toString();
                    _circumradius.text =
                        Square1.Diagonal(NEWTEXT!)[5].toString();
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  prefixText: "d = ",
                  hintText: "Diagonal",
                  hintStyle: TextStyle(
                      fontFamily: "Cairo", fontWeight: FontWeight.bold),
                ),
                maxLength: 18,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Flexible(
              child: TextField(
                controller: _inredius,
                onChanged: (_inredius) {
                  setState(() {
                    NEWTEXT = int.tryParse(_inredius);
                    NEWTEXT ??= 0;
                    _sizea.text = Square1.Inredius(NEWTEXT!)[0].toString();
                    _area.text = Square1.Inredius(NEWTEXT!)[0].toString();
                    _perimeter.text = Square1.Inredius(NEWTEXT!)[2].toString();
                    _diagonal.text = Square1.Inredius(NEWTEXT!)[3].toString();
                    //_inredius.text = Square1.Inredius(NEWTEXT!)[4].toString();
                    _circumradius.text =
                        Square1.Inredius(NEWTEXT!)[5].toString();
                    //_sizea.text = Square1.Inredius(NEWTEXT!)[0].toString();
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  prefixText: "r = ",
                  hintText: "Inredius",
                  hintStyle: TextStyle(
                      fontFamily: "Cairo", fontWeight: FontWeight.bold),
                ),
                maxLength: 18,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Flexible(
              child: TextField(
                controller: _circumradius,
                onChanged: (_circumradius) {
                  setState(() {
                    NEWTEXT = int.tryParse(_circumradius);
                    NEWTEXT ??= 0;
                    _sizea.text = Square1.Circumradius(NEWTEXT!)[0].toString();
                    _area.text = Square1.Circumradius(NEWTEXT!)[0].toString();
                    _perimeter.text =
                        Square1.Circumradius(NEWTEXT!)[2].toString();
                    _diagonal.text =
                        Square1.Circumradius(NEWTEXT!)[3].toString();
                    _inredius.text =
                        Square1.Circumradius(NEWTEXT!)[4].toString();
                    //_circumradius.text = Square1.Circumradius(NEWTEXT!)[5].toString();
                    //_sizea.value = i;
                    //Repository().placeAddApiProvider((i));
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  prefixText: "R = ",
                  hintText: "Circumradius",
                  hintStyle: TextStyle(
                      fontFamily: "Cairo", fontWeight: FontWeight.bold),
                ),
                maxLength: 18,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("img/Square2.png", fit: BoxFit.cover),
              ),
            ), // //   Row(
            //     children: [
            //       Text(
            //           (Square1.Side(NEWTEXT!)[4])
            //               .toString(), //selectedCategory!.name!,
            //           style: TextStyle(color: Colors.black54, fontSize: 40)),
            //     ],

            //     // children: [
            //     //   Text((NEWTEXT! * 2).toString(), //selectedCategory!.name!,
            //     //       style: TextStyle(color: Colors.black54, fontSize: 40)),
            //     // ],
            //   ),
            // ],
          ],
        ),
      ),
    );
  }
}
