import 'package:flutter/material.dart';

const black = Color.fromRGBO(14, 14, 14, 1);
const purple = Color.fromRGBO(81, 98, 255, 1);
const white = Color.fromRGBO(255, 255, 255, 1);
const blacks2 = Color.fromRGBO(18, 18, 18, 1);
const blacks3 = Color.fromRGBO(25, 25, 25, 1);
const blacks4 = Color.fromRGBO(28, 28, 28, 1);
const grey = Color.fromRGBO(181, 181, 181, 1);

TextStyle interR(double size, {Color color = Colors.black87}) {
  return TextStyle(fontFamily: 'InterR', color: color, fontSize: size);
}

TextStyle interM(double size, {Color color = Colors.black87}) {
  return TextStyle(
      fontFamily: 'InterM',
      color: color,
      fontSize: size,
      fontWeight: FontWeight.w600);
}
