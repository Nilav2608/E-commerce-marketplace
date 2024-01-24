
import 'package:flutter/material.dart';

class Formatters{
  String getColorName(Color color) {
  if (color == Colors.orangeAccent) {
    return 'Orange';
  } else if (color == Colors.black) {
    return 'Black';
  } else if (color == Colors.pink) {
    return 'Pink';
  }
  return 'Unknown'; // Default value for unknown colors
}
}