import 'package:flutter/material.dart';

class CircleTab extends StatelessWidget {
  final bool isSelected;
  final String data;
  // final dynamic iconSize;
  final dynamic icon;
  const CircleTab(
      {super.key,
      required this.isSelected,
      required this.icon,
      required this.data,
      //  required this.iconSize
      });

  @override
  Widget build(BuildContext context) {
    Color nameColor = isSelected ? Colors.black87 : Colors.grey;

    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFF3F3F3),
          radius: 20,
          child: Icon(
            // size: iconSize,
            icon,
            color: const Color(0xFF9D9D9D),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(data,style: TextStyle(
          color: nameColor
        ),)
      ],
    );
  }
}
//Color(0xFF3A2C27) : Color(0xFF9D9D9D) Color( isSelected ? Colors.black87 : Colors.grey  ).