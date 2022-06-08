import 'dart:math';

class Square {
  List<num> Side(num _side) {
    assert(_side >= 0, "It is not possible for the side to be $_side");
    num _area = pow(_side, 2);
    num _perimeter = 4 * _side;
    num _diagonal = _side * sqrt(2);
    num _inredius = _side / 2;
    num _circumradius = _diagonal / 2;
    List<num> arr1 = [
      _side,
      _area,
      _perimeter,
      _diagonal,
      _inredius,
      _circumradius
    ];
    return arr1;
  }

  List<num> Diagonal(num _diagonal) {
    assert(_diagonal >= 0, "It is not possible for the side to be $_diagonal");
    num _side = _diagonal / sqrt(2);
    num _perimeter = 4 * _side;
    num _area = pow(_side, 2);
    num _inredius = _side / 2;
    num _circumradius = _diagonal / 2;
    List<num> arr1 = [
      _side,
      _area,
      _perimeter,
      _diagonal,
      _inredius,
      _circumradius
    ];
    return arr1;
  }

  List<num> Perimeter(num _perimeter) {
    assert(
        _perimeter >= 0, "It is not possible for the side to be $_perimeter");
    num _side = _perimeter / 4;
    num _diagonal = _side * sqrt(2);
    num _area = pow(_side, 2);
    num _inredius = _side / 2;
    num _circumradius = _diagonal / 2;
    List<num> arr1 = [
      _side,
      _area,
      _perimeter,
      _diagonal,
      _inredius,
      _circumradius
    ];
    return arr1;
  }

  List<num> Area(num _area) {
    assert(_area >= 0, "It is not possible for the side to be $_area");
    num _side = sqrt(_area);
    num _diagonal = _side * sqrt(2);
    num _perimeter = 4 * _side;
    num _inredius = _side / 2;
    num _circumradius = _diagonal / 2;
    List<num> arr1 = [
      _side,
      _area,
      _perimeter,
      _diagonal,
      _inredius,
      _circumradius
    ];
    return arr1;
  }

  List<num> Inredius(num _inredius) {
    assert(_inredius >= 0, "It is not possible for the side to be $_inredius");
    num _side = _inredius * 2;
    num _area = pow(_side, 2);
    num _perimeter = 4 * _side;
    num _diagonal = _side * sqrt(2);
    num _circumradius = _diagonal / 2;
    List<num> arr1 = [
      _side,
      _area,
      _perimeter,
      _diagonal,
      _inredius,
      _circumradius
    ];
    return arr1;
  }

  List<num> Circumradius(num _circumradius) {
    assert(_circumradius >= 0,
        "It is not possible for the side to be $_circumradius");
    num _diagonal = _circumradius * 2;
    num _side = _diagonal / sqrt(2);
    num _perimeter = 4 * _side;
    num _inredius = _side / 2;
    num _area = pow(_side, 2);
    List<num> arr1 = [
      _side,
      _area,
      _perimeter,
      _diagonal,
      _inredius,
      _circumradius
    ];
    return arr1;
  }
}
