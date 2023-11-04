import 'package:flutter/material.dart';

class RowHeadsSeeMore extends StatelessWidget {
  final String text1;
  final String text2;
  const RowHeadsSeeMore({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        Text(
          text2,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
        ),
      ],
    );
  }
}
