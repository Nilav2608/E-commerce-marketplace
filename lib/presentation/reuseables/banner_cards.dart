import 'package:flutter/material.dart';
class BannerCards extends StatelessWidget {
  final double width;
  final double height;
  final String liteText;
  final String mainText;
  final String imagePath;
  const BannerCards(
      {super.key,
      required this.width,
      required this.height,
      required this.liteText,
      required this.mainText,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF8F8FA)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20),
            child: Column(
              children: [
                Text(
                  liteText,
                  style:
                      const TextStyle(color: Color(0xFF777E90), fontSize: 12),
                  // const TextStyle(color: Color(0xFF353945), fontSize: 12),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  height: 55,
                  child: Text(
                    mainText,
                    style:
                        const TextStyle(color: Color(0xFF353945), fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20,),
           Stack(
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFFEDEDEE),
                radius: 70,
              ),
               const CircleAvatar(
                backgroundColor: Color(0Xffe2e2e2),
                radius: 55,
              ),
              Image.asset(
                imagePath,
                )
            ],
          )
        ],
      ),
    );
  }
}
