
import 'package:flutter/material.dart';

class CircularTab extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Function(int) onTap;

  CircularTab(this.index, this.currentIndex, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == currentIndex ? Colors.blue : Colors.grey,
        ),
        child: Center(
          child: Text(
            (index + 1).toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}