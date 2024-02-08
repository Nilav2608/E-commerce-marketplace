
import 'package:flutter/material.dart';

class Formatters{
  Color getColorName(String color) {
  if (color == 'Orange') {
    return Colors.orangeAccent;
  } else if (color == 'Black' ) {
    return Colors.black;
  } else if (color == "Pink") {
    return Colors.pink;
  }
  return Colors.grey; // Default value for unknown colors
}
}