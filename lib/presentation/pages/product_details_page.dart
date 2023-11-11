import 'package:flutter/material.dart';
import 'package:fluxestore/models/ColorsCatagoryModel.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

List<ColorsCatagoryModel> colorsIsSelected = [
  ColorsCatagoryModel(0xffE7C0A7, true),
  ColorsCatagoryModel(0xff050302, false),
  ColorsCatagoryModel(0xffEE6969, false)
];

bool selectedColor = true;

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                  //  width:375,
                  //  height:400,
                  "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhpbmclMjBtb2RlbCUyMHBvc2V8ZW58MHx8MHx8fDA%3D"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                      style: ButtonStyle(
                        // fixedSize: const MaterialStatePropertyAll(Size(10, 10)),
                        elevation: const MaterialStatePropertyAll(5),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        shadowColor: MaterialStatePropertyAll(
                          Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                      style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(Size(32, 32)),
                        elevation: const MaterialStatePropertyAll(5),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        shadowColor: MaterialStatePropertyAll(
                          Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        PrimaryIcons.heart,
                        size: 19,
                        color: Color(0xffD8D8D8),
                      )),
                ),
              ],
            ),
            // scroll()
            DraggableScrollableSheet(
              initialChildSize: 0.6,
              maxChildSize: 1.0,
              minChildSize: 0.6,
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          // Container(
                          //   height: 5,
                          //   width: 35,
                          //   color: Colors.black12,
                          // ),
                          const SizedBox(
                            height: 20,
                          ),

                          //* -->      Product Name-starrating and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Street Wear",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xff1D1F22)),
                                  ),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: 4,
                                        itemBuilder: (context, index) =>
                                            const Icon(
                                          Icons.star,
                                          color: Color(0xff508A7B),
                                        ),
                                        itemCount: 5,
                                        itemSize: 20.0,
                                        direction: Axis.horizontal,
                                      ),
                                      const Text(
                                        "(83)",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff1D1F22)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Text(
                                "\$80.00",
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff1D1F22)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Divider(
                            color: Color(0xffF3F3F6),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Color",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff777E90)),
                                  ),
                                  Row(
                                    children: [
                                      for (int i = 0;
                                          i < colorsIsSelected.length;
                                          i++)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              colorsIsSelected[i]
                                                  .selectedColor = !colorsIsSelected[i]
                                                  .selectedColor;
                                              // !colorsIsSelected[i][1];
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Stack(
                                              children: [
                                                Material(
                                                  // shape: const CircleBorder(side:  BorderSide(width: 1) ),
                                                  borderRadius:BorderRadius.circular(20),
                                                  // elevation: 2,
                                                  child: Container(
                                                      // color: Colors.white,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape:BoxShape.circle,
                                                          border: Border.all(
                                                              width: colorsIsSelected[i].selectedColor ? 3 : 0,
                                                              color: Colors.white),
                                                          boxShadow: [
                                                            colorsIsSelected[i].selectedColor
                                                                ? BoxShadow(
                                                                    blurRadius:6,
                                                                    color: Colors.grey.shade400,
                                                                    offset:const Offset( 0.001,6),
                                                                    spreadRadius:0.5)
                                                                : const BoxShadow()
                                                          ]),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: Color(
                                                            colorsIsSelected[i]
                                                                .color),
                                                      )),
                                                ),
                                                // Container(
                                                //   // color: Colors.white,
                                                //   decoration:  BoxDecoration(
                                                //       color: Colors.white,
                                                //       shape: BoxShape.circle,
                                                //       boxShadow: [
                                                //         BoxShadow(
                                                //             blurRadius: 10,
                                                //             color: Colors.grey.shade400,
                                                //             spreadRadius: 5)
                                                //       ]

                                                //       ),
                                                //       child:CircleAvatar(
                                                //      radius: 12,
                                                //     backgroundColor: Color(colors[i]),
                                                // )
                                                // ),
                                                //  CircleAvatar(
                                                //   radius:14 ,
                                                //   backgroundColor: Colors.black26,
                                                //   child: CircleAvatar(
                                                //    radius: 12,
                                                //   backgroundColor: Color(colors[i]),
                                                // ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

scroll() {
  return DraggableScrollableSheet(
    initialChildSize: 0.6,
    maxChildSize: 1.0,
    minChildSize: 0.6,
    builder: (context, scrollController) {
      return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Container(
                //   height: 5,
                //   width: 35,
                //   color: Colors.black12,
                // ),
                const SizedBox(
                  height: 20,
                ),

                //* -->      Product Name-starrating and price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Street Wear",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff1D1F22)),
                        ),
                        Row(
                          children: [
                            RatingBarIndicator(
                              rating: 4,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Color(0xff508A7B),
                              ),
                              itemCount: 5,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                            const Text(
                              "(83)",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1D1F22)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      "\$80.00",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff1D1F22)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  color: Color(0xffF3F3F6),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Color",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777E90)),
                        ),
                        Row(
                          children: [
                            for (int i = 0; i < colorsIsSelected.length; i++)
                              GestureDetector(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Stack(
                                    children: [
                                      Material(
                                        // shape: const CircleBorder(side:  BorderSide(width: 1) ),
                                        borderRadius: BorderRadius.circular(20),
                                        elevation: 2,
                                        child: Container(
                                            // color: Colors.white,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    width: colorsIsSelected[i]
                                                            .selectedColor
                                                        ? 3
                                                        : 0,
                                                    color: Colors.white),
                                                boxShadow: [
                                                  colorsIsSelected[i]
                                                          .selectedColor
                                                      ? BoxShadow(
                                                          blurRadius: 6,
                                                          color: Colors
                                                              .grey.shade400,
                                                          offset: const Offset(
                                                              0.001, 6),
                                                          spreadRadius: 0.5)
                                                      : const BoxShadow()
                                                ]),
                                            child: CircleAvatar(
                                              radius: 12,
                                              backgroundColor: Color(
                                                  colorsIsSelected[i].color),
                                            )),
                                      ),
                                      // Container(
                                      //   // color: Colors.white,
                                      //   decoration:  BoxDecoration(
                                      //       color: Colors.white,
                                      //       shape: BoxShape.circle,
                                      //       boxShadow: [
                                      //         BoxShadow(
                                      //             blurRadius: 10,
                                      //             color: Colors.grey.shade400,
                                      //             spreadRadius: 5)
                                      //       ]

                                      //       ),
                                      //       child:CircleAvatar(
                                      //      radius: 12,
                                      //     backgroundColor: Color(colors[i]),
                                      // )
                                      // ),
                                      //  CircleAvatar(
                                      //   radius:14 ,
                                      //   backgroundColor: Colors.black26,
                                      //   child: CircleAvatar(
                                      //    radius: 12,
                                      //   backgroundColor: Color(colors[i]),
                                      // ),
                                      // ),
                                    ],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}

//  Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Container(
//             // padding: const EdgeInsets.only(left: 8),
//             width: 32,
//             height: 32,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               shape: BoxShape.circle,
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 5,
//                     offset: const Offset(2, 0))
//               ],
//             ),
//             child: const Icon(Icons.arrow_back_ios_new_rounded)
//           ),
//         ),

// Padding(
//   padding: const EdgeInsets.only(right: 12.0),
//   child: Container(
//     width: 32,
//     height: 32,
//     decoration: BoxDecoration(
//         color: Colors.white,
//         // borderRadius: BorderRadius.circular(60),
//         boxShadow: [
//           BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: const Offset(2, 0))
//         ],
//         shape: BoxShape.circle),
//     child: const Icon(
//       PrimaryIcons.heart,
//       size: 19,
//       color: Color(0xffD8D8D8),
//     ),
//   ),
// ),
