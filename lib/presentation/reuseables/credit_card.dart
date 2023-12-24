import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CrediCard extends StatelessWidget {
  final String cardUrl;
  const CrediCard({super.key, required this.cardUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 18),
      child: SizedBox(
        width: 327,
        height: 191,
        child: Stack(children: [
          Image.asset(
            cardUrl.toString(),
            width: double.infinity,
            height: 191,
            fit: BoxFit.contain,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      "assets/images/visa-logo.svg",
                      width: 61,
                      height: 20,
                      fit: BoxFit.cover,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              //? card number
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "4364",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 3),
                  ),
                  Text("1345",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3)),
                  Text("8932",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          letterSpacing: 3,
                          fontWeight: FontWeight.w400)),
                  Text("8378",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CARDHOLDER NAME",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Sunie Pham",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("VALID THRU",
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 5,
                        ),
                        Text("05/24",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
