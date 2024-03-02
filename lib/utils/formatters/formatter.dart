
import 'package:flutter/material.dart';

class Formatters{
  Color getColorName(String color) {
  switch (color.toLowerCase()) {
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;  
    case 'orange':
      return Colors.orangeAccent;  
    case 'pink':
      return Colors.pink;
    case 'green':
      return Colors.lightGreen.shade300; // Soft green color
    case 'peach':
      return Colors.orangeAccent.shade100; // Soft peach color
    case 'blue':
      return Colors.lightBlue.shade300; // Soft blue color
    case 'red':
      return Colors.redAccent.shade100; // Soft red color
    case 'yellow':
      return Colors.yellow.shade300; // Soft yellow color
    case 'purple':
      return Colors.purple.shade300; // Soft purple color
    case 'cyan':
      return Colors.cyan.shade300; // Soft cyan color
    case 'teal':
      return Colors.teal.shade300; // Soft teal color
    case 'amber':
      return Colors.amber.shade300; // Soft amber color
    case 'lime':
      return Colors.lime.shade300; // Soft lime color
    case 'indigo':
      return Colors.indigo.shade300; // Soft indigo color
    case 'brown':
      return Colors.brown.shade300; // Soft brown color
    case 'grey':
      return Colors.grey.shade300; // Soft grey color
    case 'deeporange':
      return Colors.deepOrange.shade300; // Soft deep orange color
    case 'deeppurple':
      return Colors.deepPurple.shade300; // Soft deep purple color
    case 'lightblue':
      return Colors.lightBlue.shade300; // Soft light blue color
    case 'lightgreen':
      return Colors.lightGreen.shade300; // Soft light green color
    default:
      return Colors.grey; // Default value for unknown colors
  }
}
}