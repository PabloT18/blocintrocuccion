import 'dart:math' as math;
import 'package:flutter/cupertino.dart';

class ResponsiveUtil {
  ResponsiveUtil(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ancho = size.width;
    alto = size.height;
    diagonal = math.sqrt(math.pow(ancho!, 2) + math.pow(alto!, 2));
    portrait = MediaQuery.of(context).orientation == Orientation.portrait;
  }

  late bool portrait;
  double? ancho, alto, diagonal;

  double anchoP(double porcentaje) {
    return ancho! * porcentaje / 100;
  }

  double altoP(double porcentaje) {
    return alto! * porcentaje / 100;
  }

  double diagonalP(double porcentaje) {
    return diagonal! * porcentaje / 100;
  }

  bool isHorizontal() {
    bool resul = false;
    if (ancho! > alto!) {
      resul = true;
    }
    return resul;
  }

  bool isVertical() {
    bool resul = false;
    if (alto! > ancho!) {
      resul = true;
    }
    return resul;
  }
}
