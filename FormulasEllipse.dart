import 'dart:math';

class Hyperbole {
  Point? _center, _focus1, _focus2, _vertex1, _vertex2;
  num? _a, _b, _c;
  bool? _isOpenOnXAxis;
  String? _equation;

  set center(Point center) {
    _center = center;
  }

  set focus1(Point focus1) {
    _focus1 = focus1;
  }

  set focus2(Point focus2) {
    _focus2 = focus2;
  }

  set vertex1(Point vertex1) {
    _vertex1 = vertex1;
  }

  set vertex2(Point vertex2) {
    _vertex2 = vertex2;
  }

  set a(num a) {
    _a = a;
  }

  set b(num b) {
    _b = b;
  }

  set c(num c) {
    _c = c;
  }

  set isOpenOnXAxis(bool isOpenOnXAxis) {
    _isOpenOnXAxis = isOpenOnXAxis;
  }

  String printEquationAndData() {
    var buffer = StringBuffer();
    if (_isOpenOnXAxis != null) {
      if (!_isOpenOnXAxis!) {
        if (_a != null && _b != null) {
          String a = pow(_a!, 2).toStringAsFixed(2);
          String b = pow(_b!, 2).toStringAsFixed(2);
          _equation = "y²/$a - x²/$b = 1";
        } else if (_a != null) {
          String a = pow(_a!, 2).toStringAsFixed(2);
          _equation = "y²/$a - x²/b² = 1";
        } else if (_b != null) {
          String b = pow(_b!, 2).toStringAsFixed(2);
          _equation = "y²/a² - x²/$b = 1";
        } else {
          _equation = "y²/a² - x²/b² = 1";
        }
        buffer.writeln(
            "This is a vertical hyperbole and its equation is $_equation.");
      } else if (_isOpenOnXAxis!) {
        if (_a != null && _b != null) {
          String a = pow(_a!, 2).toStringAsFixed(2);
          String b = pow(_b!, 2).toStringAsFixed(2);
          _equation = "x²/$a - y²/$b = 1";
        } else if (_a != null) {
          String a = pow(_a!, 2).toStringAsFixed(2);
          _equation = "x²/$a - y²/b² = 1";
        } else if (_b != null) {
          String b = pow(_b!, 2).toStringAsFixed(2);
          _equation = "x²/a² - y²/$b = 1";
        } else {
          _equation = "x²/a² - y²/b² = 1";
        }
        buffer.writeln(
            "This is a horizontal hyperbole and its equation is $_equation.");
      }
    } else {
      if (_a != null && _b != null) {
        String a = pow(_a!, 2).toStringAsFixed(2);
        String b = pow(_b!, 2).toStringAsFixed(2);
        _equation = "x²/$a - y²/$b = 1";
      } else if (_a != null) {
        String a = pow(_a!, 2).toStringAsFixed(2);
        _equation = "x²/$a - y²/b² = 1";
      } else if (_b != null) {
        String b = pow(_b!, 2).toStringAsFixed(2);
        _equation = "x²/a² - y²/$b = 1";
      } else {
        _equation = "x²/a² - y²/b² = 1";
      }
      buffer.writeln(
          "The hyperbole's position in unknown and its default equation is $_equation.");
    }

    if (_a != null) {
      String a = _a!.toStringAsFixed(2);
      buffer.writeln("The value of a equals $a.");
    } else {
      buffer.writeln("The value of a is unknown.");
    }
    if (_b != null) {
      String b = _b!.toStringAsFixed(2);
      buffer.writeln("The value of b equals $b.");
    } else {
      buffer.writeln("The value of b is unknown.");
    }
    if (_c != null) {
      String c = _c!.toStringAsFixed(2);
      buffer.writeln("The value of c equals $c.");
    } else {
      buffer.writeln("The value of c is unknown.");
    }

    if (_center != null) {
      String x = _center!.getX!.toStringAsFixed(2);
      String y = _center!.getY!.toStringAsFixed(2);
      buffer.writeln("The coordinates of the center are ($x; $y).");
    } else {
      buffer.writeln("The coordinates of the center are unknown.");
    }

    if (_vertex1 != null && _vertex2 != null) {
      String x1 = _vertex1!.getX!.toStringAsFixed(2);
      String y1 = _vertex1!.getY!.toStringAsFixed(2);
      String x2 = _vertex2!.getX!.toStringAsFixed(2);
      String y2 = _vertex2!.getY!.toStringAsFixed(2);
      buffer.writeln(
          "The coordinates of the vertices are ($x1; $y1) and ($x2; $y2).");
    } else if (_vertex1 != null || _vertex2 != null) {
      String x;
      String y;
      if (_vertex1 != null) {
        x = _vertex1!.getX!.toStringAsFixed(2);
        y = _vertex1!.getY!.toStringAsFixed(2);
      } else {
        x = _vertex2!.getX!.toStringAsFixed(2);
        y = _vertex2!.getY!.toStringAsFixed(2);
      }
      buffer.writeln(
          "The coordinates of one vertex are ($x; $y). The other vertex is unknown.");
    } else {
      buffer.writeln("The coordinates of the vertices are unknown.");
    }

    if (_focus1 != null && _focus2 != null) {
      String x1 = _focus1!.getX!.toStringAsFixed(2);
      String y1 = _focus1!.getY!.toStringAsFixed(2);
      String x2 = _focus2!.getX!.toStringAsFixed(2);
      String y2 = _focus2!.getY!.toStringAsFixed(2);
      buffer.writeln(
          "The coordinates of the foci are ($x1; $y1) and ($x2; $y2).");
    } else if (_focus1 != null || _focus2 != null) {
      String x;
      String y;
      if (_focus1 != null) {
        x = _focus1!.getX!.toStringAsFixed(2);
        y = _focus1!.getY!.toStringAsFixed(2);
      } else {
        x = _focus2!.getX!.toStringAsFixed(2);
        y = _focus2!.getY!.toStringAsFixed(2);
      }
      buffer.writeln(
          "The coordinates of one focus are ($x; $y). The other focus is unknown.");
    } else {
      buffer.writeln("The coordinates of the foci are unknown.");
    }

    return buffer.toString();
  }

  void setUsingaAndb(num a, num b) {
    _a = a;
    _b = b;
    _c = sqrt(pow(a, 2) + pow(b, 2));
    _errorCheckerForabc(_a!, _b!, _c!);
  }

  void setUsingaAndc(num a, num c) {
    _a = a;
    _c = c;
    _b = sqrt(pow(c, 2) - pow(a, 2));
    _errorCheckerForabc(_a!, _b!, _c!);
  }

  void setUsingbAndc(num b, num c) {
    _b = b;
    _c = c;
    _a = sqrt(pow(c, 2) - pow(b, 2));
    _errorCheckerForabc(_a!, _b!, _c!);
  }

  void setUsingVertices(Point vertex1, Point vertex2) {
    _vertex1 = vertex1;
    _vertex2 = vertex2;
    setUsingAnyTwoPoints(vertex1, vertex2);
    if (!_isOpenOnXAxis!) {
      num yCenter = (vertex2.getY! + vertex1.getY!) / 2;
      _center = Point(vertex1.getX!, yCenter);
      _a = (yCenter - vertex1.getY!).abs();
    } else if (_isOpenOnXAxis!) {
      num xCenter = (vertex1.getX! + vertex2.getX!) / 2;
      _isOpenOnXAxis = true;
      _center = Point(xCenter, vertex1.getY!);
      _a = (xCenter - vertex1.getX!).abs();
    }
  }

  void setUsingVerticesAndFocus(Point vertex1, Point vertex2, Point focus) {
    setUsingVertices(vertex1, vertex2);
    _errorCheckerForVerticesAndFocus(vertex1, vertex2, focus, _isOpenOnXAxis!);
    setUsingCenterAndFocus(_center!, focus);
    setUsingaAndc(_a!, _c!);
  }

  void setUsingVerticesAndb(Point vertex1, Point vertex2, num b) {
    setUsingVertices(vertex1, vertex2);
    setUsingaAndb(_a!, b);
    setUsingCentercAndPosition(_center!, _c!, _isOpenOnXAxis!);
  }

  void setUsingVerticesAndc(Point vertex1, Point vertex2, num c) {
    setUsingVertices(vertex1, vertex2);
    setUsingCentercAndPosition(_center!, c, _isOpenOnXAxis!);
    setUsingaAndc(_a!, c);
  }

  void setUsingFoci(Point focus1, Point focus2) {
    _focus1 = focus1;
    _focus2 = focus2;
    setUsingAnyTwoPoints(focus1, focus2);
    if (!_isOpenOnXAxis!) {
      num yCenter = (focus2.getY! + focus1.getY!) / 2;
      _center = Point(focus1.getX!, yCenter);
      _c = (yCenter - focus1.getY!).abs();
    } else if (_isOpenOnXAxis!) {
      num xCenter = (focus1.getX! + focus2.getX!) / 2;
      _center = Point(xCenter, focus1.getY!);
      _c = (xCenter - focus1.getX!).abs();
    }
  }

  void setUsingFociAndVertex(Point focus1, Point focus2, Point vertex) {
    setUsingFoci(focus1, focus2);
    _errorCheckerForFociAndVertex(focus1, focus2, vertex, _isOpenOnXAxis!);
    setUsingCenterAndVertex(_center!, vertex);
    setUsingaAndc(_a!, _c!);
  }

  void setUsingFociAnda(Point focus1, Point focus2, num a) {
    setUsingFoci(focus1, focus2);
    setUsingCenteraAndPosition(_center!, a, _isOpenOnXAxis!);
    setUsingaAndc(a, _c!);
  }

  void setUsingFociAndb(Point focus1, Point focus2, num b) {
    setUsingFoci(focus1, focus2);
    setUsingbAndc(b, _c!);
    setUsingCenteraAndPosition(_center!, _a!, _isOpenOnXAxis!);
  }

  void setUsingCenteraAndPosition(Point center, num a, bool isOpenOnXAxis) {
    _center = center;
    if (a <= 0) {
      throw Exception("a <= 0 is an error.");
    }
    _a = a;
    _isOpenOnXAxis = isOpenOnXAxis;
    if (_isOpenOnXAxis!) {
      _vertex1 = Point(center.getX! - a, center.getY!);
      _vertex2 = Point(center.getX! + a, center.getY!);
    } else if (!_isOpenOnXAxis!) {
      _vertex1 = Point(center.getX!, center.getY! - a);
      _vertex2 = Point(center.getX!, center.getY! + a);
    }
  }

  void setUsingCenteraPositionAndb(
      Point center, num a, bool isOpenOnXAxis, num b) {
    setUsingCenteraAndPosition(center, a, isOpenOnXAxis);
    setUsingCenterbAndVertex(center, b, _vertex1!);
    _errorCheckerForFociAndVertex(
        _focus1!, _focus2!, _vertex1!, _isOpenOnXAxis!);
    _errorCheckerForVerticesAndFocus(
        _vertex1!, _vertex2!, _focus1!, _isOpenOnXAxis!);
  }

  void setUsingCenteraPositionAndc(
      Point center, num a, bool isOpenOnXAxis, num c) {
    setUsingCenteraAndPosition(center, a, isOpenOnXAxis);
    setUsingCentercAndVertex(center, c, _vertex1!);
    _errorCheckerForFociAndVertex(
        _focus1!, _focus2!, _vertex1!, _isOpenOnXAxis!);
    _errorCheckerForVerticesAndFocus(
        _vertex1!, _vertex2!, _focus1!, _isOpenOnXAxis!);
  }

  void setUsingCenteraAndFocus(Point center, num a, Point focus) {
    setUsingCenterAndFocus(center, focus);
    setUsingaAndc(a, _c!);
    setUsingCenteraAndPosition(center, a, _isOpenOnXAxis!);
  }

  void setUsingCenterbAndFocus(Point center, num b, Point focus) {
    setUsingCenterAndFocus(center, focus);
    setUsingbAndc(b, _c!);
    setUsingCenteraAndPosition(center, _a!, _isOpenOnXAxis!);
  }

  void setUsingCentercAndPosition(Point center, num c, bool isOpenOnXAxis) {
    _center = center;
    if (c <= 0) {
      throw Exception("c <= 0 is an error.");
    }
    _c = c;
    _isOpenOnXAxis = isOpenOnXAxis;
    if (_isOpenOnXAxis!) {
      _focus1 = Point(center.getX! - c, center.getY!);
      _focus2 = Point(center.getX! + c, center.getY!);
    } else if (!_isOpenOnXAxis!) {
      _focus1 = Point(center.getX!, center.getY! - c);
      _focus2 = Point(center.getX!, center.getY! + c);
    }
  }

  void setUsingCenterbPositionAndc(
      Point center, num b, bool isOpenOnXAxis, num c) {
    setUsingCentercAndPosition(center, c, isOpenOnXAxis);
    setUsingCenterbAndFocus(center, b, _focus1!);
    _errorCheckerForFociAndVertex(
        _focus1!, _focus2!, _vertex1!, _isOpenOnXAxis!);
    _errorCheckerForVerticesAndFocus(
        _vertex1!, _vertex2!, _focus1!, _isOpenOnXAxis!);
  }

  void setUsingCentercAndVertex(Point center, num c, Point vertex) {
    setUsingCenterAndVertex(center, vertex);
    setUsingaAndc(_a!, c);
    setUsingCentercAndPosition(center, c, _isOpenOnXAxis!);
  }

  void setUsingCenterbAndVertex(Point center, num b, Point vertex) {
    setUsingCenterAndVertex(center, vertex);
    setUsingaAndb(_a!, b);
    setUsingCentercAndPosition(center, _c!, _isOpenOnXAxis!);
  }

  void setUsingCenterAndVertex(Point center, Point vertex) {
    _center = center;
    _vertex1 = vertex;
    setUsingAnyTwoPoints(center, vertex);
    if (!_isOpenOnXAxis!) {
      _a = (center.getY! - vertex.getY!).abs();
      if (center.getY! > vertex.getY!) {
        _vertex2 = Point(center.getX!, center.getY! + _a!);
      } else if (center.getY! < vertex.getY!) {
        _vertex2 = Point(center.getX!, center.getY! - _a!);
      }
    } else if (_isOpenOnXAxis!) {
      _a = (center.getX! - vertex.getX!).abs();
      if (center.getX! > vertex.getX!) {
        _vertex2 = Point(center.getX! + _a!, center.getY!);
      } else if (center.getX! < vertex.getX!) {
        _vertex2 = Point(center.getX! - _a!, center.getY!);
      }
    }
  }

  void setUsingCenterVertexAndFocus(Point center, Point vertex, Point focus) {
    setUsingCenterAndFocus(center, focus);
    bool checker = _isOpenOnXAxis!;
    setUsingCenterAndVertex(center, vertex);
    if (_isOpenOnXAxis != checker) {
      throw Exception("Given vertex and focus are not part of a same axis!");
    }
    _errorCheckerForFociAndVertex(_focus1!, _focus2!, vertex, _isOpenOnXAxis!);
    _errorCheckerForVerticesAndFocus(
        _vertex1!, _vertex2!, focus, _isOpenOnXAxis!);
    setUsingaAndc(_a!, _c!);
  }

  void setUsingCenterAndFocus(Point center, Point focus) {
    _center = _center;
    _focus1 = focus;
    setUsingAnyTwoPoints(center, focus);
    if (!_isOpenOnXAxis!) {
      _c = (center.getY! - focus.getY!).abs();
      if (center.getY! > focus.getY!) {
        _focus2 = Point(center.getX!, center.getY! + _c!);
      } else if (center.getY! < focus.getY!) {
        _focus2 = Point(center.getX!, center.getY! - _c!);
      }
    } else if (_isOpenOnXAxis!) {
      _c = (center.getX! - focus.getX!).abs();
      if (center.getX! > focus.getX!) {
        _focus2 = Point(center.getX! + _c!, center.getY!);
      } else if (center.getX! < focus.getX!) {
        _focus2 = Point(center.getX! - _c!, center.getY!);
      }
    }
  }

// Note: Focus and Vertex are on the same side of the center
  void setUsingFocus1Vertex1Anda(Point focus1, Point vertex1, num a) {
    _focus1 = focus1;
    _vertex1 = vertex1;
    if (a <= 0) {
      throw Exception("a <= 0 is an error.");
    }
    _a = a;
    setUsingAnyTwoPoints(focus1, vertex1);
    num? diff;
    if (!_isOpenOnXAxis!) {
      diff = (vertex1.getY! - focus1.getY!).abs();
      _findCenterForOpenOnYAxis(focus1, vertex1, _a!);
    } else if (_isOpenOnXAxis!) {
      diff = (vertex1.getX! - focus1.getX!).abs();
      _findCenterForOpenOnXAxis(focus1, vertex1, _a!);
    }
    _c = a + diff!;
    setUsingaAndc(_a!, _c!);
    setUsingCenterAndFocus(_center!, _focus1!);
    setUsingCenterAndVertex(_center!, _vertex1!);
  }

// Note: Focus and Vertex are on the same side of the center
  void setUsingFocus1Vertex1Andb(Point focus1, Point vertex1, num b) {
    _focus1 = focus1;
    _vertex1 = vertex1;
    if (b <= 0) {
      throw Exception("b <= 0 is an error.");
    }
    _b = b;
    setUsingAnyTwoPoints(focus1, vertex1);
    num diff;
    if (!_isOpenOnXAxis!) {
      diff = (vertex1.getY! - focus1.getY!).abs();
      _a = (pow(b, 2) - pow(diff, 2)) / (2 * diff);
      _findCenterForOpenOnYAxis(focus1, vertex1, _a!);
    } else if (_isOpenOnXAxis!) {
      diff = (vertex1.getX! - focus1.getX!).abs();
      _a = (pow(b, 2) - pow(diff, 2)) / (2 * diff);
      _findCenterForOpenOnXAxis(focus1, vertex1, _a!);
    }
    setUsingaAndb(_a!, _b!);
    setUsingCenterAndFocus(_center!, _focus1!);
    setUsingCenterAndVertex(_center!, _vertex1!);
  }

// Note: Focus and Vertex are on the same side of the center
  void setUsingFocus1Vertex1Andc(Point focus1, Point vertex1, num c) {
    _focus1 = focus1;
    _vertex1 = vertex1;
    if (c <= 0) {
      throw Exception("c <= 0 is an error.");
    }
    _c = c;
    setUsingAnyTwoPoints(focus1, vertex1);
    num diff;
    if (!_isOpenOnXAxis!) {
      diff = (vertex1.getY! - focus1.getY!).abs();
      _a = c - diff;
      _findCenterForOpenOnYAxis(focus1, vertex1, _a!);
    } else if (_isOpenOnXAxis!) {
      diff = (vertex1.getX! - focus1.getX!).abs();
      _a = c - diff;
      _findCenterForOpenOnXAxis(focus1, vertex1, _a!);
    }
    setUsingaAndc(_a!, _c!);
    setUsingCenterAndFocus(_center!, _focus1!);
    setUsingCenterAndVertex(_center!, _vertex1!);
  }

  void setUsingAnyTwoPoints(Point point1, Point point2) {
    if (point1.getX == point2.getX && point1.getY == point2.getY) {
      throw Exception("Error! The given points coincide!");
    } else if (point1.getX == point2.getX) {
      _isOpenOnXAxis = false;
    } else if (point1.getY == point2.getY) {
      _isOpenOnXAxis = true;
    } else {
      throw Exception("The given points are not part of a same axis!");
    }
  }

  void _findCenterForOpenOnYAxis(Point focus1, Point vertex1, num a) {
    if (focus1.getY! > vertex1.getY!) {
      _center = Point(vertex1.getX!, vertex1.getY! - _a!);
    } else if (focus1.getY! < vertex1.getY!) {
      _center = Point(vertex1.getX!, vertex1.getY! + _a!);
    }
  }

  void _findCenterForOpenOnXAxis(Point focus1, Point vertex1, num a) {
    if (focus1.getX! > vertex1.getX!) {
      _center = Point(vertex1.getX! - _a!, vertex1.getY!);
    } else if (focus1.getX! < vertex1.getX!) {
      _center = Point(vertex1.getX! + _a!, vertex1.getY!);
    }
  }

  void _errorCheckerForFociAndVertex(
      Point focus1, Point focus2, Point vertex, bool isOpenOnXAxis) {
    if (isOpenOnXAxis) {
      if (focus1.getY! != vertex.getY!) {
        throw Exception("Focus and vertex should be on the same Y axis!");
      }
      if ((vertex.getX! > focus1.getX! && vertex.getX! > focus2.getX!) ||
          (vertex.getX! < focus1.getX! && vertex.getX! < focus2.getX!)) {
        throw Exception("Vertex must be between the foci!");
      }
    } else {
      if (focus1.getX! != vertex.getX!) {
        throw Exception("Focus and vertex should be on the same X axis!");
      }
      if ((vertex.getY! > focus1.getY! && vertex.getY! > focus2.getY!) ||
          (vertex.getY! < focus1.getY! && vertex.getY! < focus2.getY!)) {
        throw Exception("Vertex must be between the foci!");
      }
    }
  }

  void _errorCheckerForVerticesAndFocus(
      Point vertex1, Point vertex2, Point focus, bool isOpenOnXAxis) {
    if (isOpenOnXAxis) {
      if (vertex1.getY! != focus.getY!) {
        throw Exception("Focus and vertex should be on the same Y axis!");
      }
      if ((focus.getX! > vertex1.getX! && focus.getX! < vertex2.getX!) ||
          (focus.getX! < vertex1.getX! && focus.getX! > vertex2.getX!)) {
        throw Exception("Focus cannot be between the vertices!");
      }
    } else {
      if (vertex1.getX! != focus.getX!) {
        throw Exception("Focus and vertex should be on the same X axis!");
      }
      if ((focus.getY! > vertex1.getY! && focus.getY! < vertex2.getY!) ||
          (focus.getY! < vertex1.getY! && focus.getY! > vertex2.getY!)) {
        throw Exception("Focus cannot be between the vertices!");
      }
    }
  }

  void _errorCheckerForabc(num a, num b, num c) {
    if (c <= a) {
      throw Exception("c cannot be less or equal to a!");
    }
    if (c <= b) {
      throw Exception("c cannot be less or equal to b!");
    }
    if (a <= 0) {
      throw Exception("a cannot be less or equal to 0!");
    }
    if (b <= 0) {
      throw Exception("b cannot be less or equal to 0!");
    }
    if (c <= 0) {
      throw Exception("c cannot be less or equal to 0!");
    }
  }
}

class Point {
  num? _x;
  num? _y;

  Point(num x, num y) {
    _x = x;
    _y = y;
  }

  num? get getX {
    return _x;
  }

  num? get getY {
    return _y;
  }
}
