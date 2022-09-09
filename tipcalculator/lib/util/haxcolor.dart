import 'package:flutter/material.dart';

class HaxColor extends Color {
  static int _getColorfromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HaxColor(final String hexColor) : super(_getColorfromHex(hexColor));
}
