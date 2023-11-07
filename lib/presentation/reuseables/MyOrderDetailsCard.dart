import 'package:flutter/material.dart';

class MyOrderDetailsCard extends StatelessWidget {
  const MyOrderDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0),
      child: Container(
        width: 336,
        height: 182,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color(0xffe8e8e8),
                blurRadius: 10.0,
                offset: Offset(0, 1))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order #1514",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "13/05/2021",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff777E90),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Tracking number:",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff777E90),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    " IK287368838",
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff141416),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Quantity: ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff777E90),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff141416),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Subtotal: ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff777E90),
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "\$110",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff141416),
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "PENDING",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffCF6212),
                          fontWeight: FontWeight.w400),
                    ),
                    OutlinedButton(
                        onPressed: () {},
                        
                        child: const Text("Details",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff141416),
                                fontWeight: FontWeight.w400)))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
