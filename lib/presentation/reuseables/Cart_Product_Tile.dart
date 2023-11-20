import 'package:flutter/material.dart';

class CartProductTile extends StatelessWidget {
  final Function()? increment;
  final Function()? decrement;
  final int quantity;
  const CartProductTile(
      {super.key, required this.increment, required this.decrement, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 310,
        height: 120,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xffe8e8e8),
                  blurRadius: 10.0,
                  offset: Offset(0, 1))
            ],
            borderRadius: BorderRadius.circular(20)),
        //main row
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Image
            Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Image.network(
                      "https://t3.gstatic.com/images?q=tbn:ANd9GcS_zRNrc2kC5Rg-OiFLvyRKUy-A3jWuzSjvQEluYLkZ7JK_m-wd",
                      width: 98,
                      height: 120,
                      fit: BoxFit.cover),
                ),
              ],
            ),
    
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name and check box
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Rise Crop Hoodie",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                          activeColor: const Color(0xff508A7B),
                          checkColor: Colors.white,
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          "\$80.00",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Size: M  |  Color: White",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8A8A8F),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: const Color(0xff808080)),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: decrement,
                                child: const Text(
                                  "-",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xff808080)),
                                ),
                              ),
                               Text(
                                quantity.toString(),
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xff808080)),
                              ),
                              GestureDetector(
                                onTap: increment,
                                child: const Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xff808080)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
