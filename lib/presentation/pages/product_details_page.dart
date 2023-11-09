import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: ClipRRect(
                child: Image.network(
                      //  width:375,
                      //  height:400,
                    "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhpbmclMjBtb2RlbCUyMHBvc2V8ZW58MHx8MHx8fDA%3D"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    Padding(
                      padding: const EdgeInsets.all( 10.0),
                      child: IconButton(
                      style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(Size(24, 32)),
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
                  padding: const EdgeInsets.all( 10.0),
                  child: IconButton(
                      style: ButtonStyle(
                        fixedSize: const MaterialStatePropertyAll(Size(24, 32)),
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
            )
          ],
        ),
      ),
    );
  }
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