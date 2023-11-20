import 'package:flutter/material.dart';
import 'package:fluxestore/data/product_recomendation_data.dart';
import 'package:fluxestore/models/ColorsCatagoryModel.dart';
import 'package:fluxestore/models/ProductReviewModel.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluxestore/presentation/Icons/secondary_icons_icons.dart';
import 'package:fluxestore/presentation/reuseables/ProductListViewBuilder.dart';
import 'package:fluxestore/presentation/reuseables/ExpansionPanel.dart';
import 'package:fluxestore/presentation/reuseables/ProductRatingProgressBars.dart';

import '../../models/productModel.dart';
import '../reuseables/ProductReviewsTile.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProducDatatModel data;
  const ProductDetailsPage({super.key, required this.data});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

List<ColorsCatagoryModel> colorsIsSelected = [
  ColorsCatagoryModel(0xffE7C0A7, true),
  ColorsCatagoryModel(0xff050302, false),
  ColorsCatagoryModel(0xffEE6969, false)
];

List ratingData = [
  ["5", 0.8, 80],
  ["4", 0.6, 12],
  ["3", 0.4, 5],
  ["2", 0.20, 3],
  ["1", 0.0, 0],
];

List<ProductReviewModel> reviews = [
  ProductReviewModel(
      name: "Jennifer Rose",
      profileImage: "assets/images/girl1.png",
      description:
          "I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!",
      date: DateTime.now().toString(),
      stars: 5,
      productImages: []),
  ProductReviewModel(
      name: "Kelly Rihana",
      profileImage: "assets/images/girl2.png",
      description:
          "I'm very happy with order, It was delivered on and good quality. Recommended!",
      date: DateTime.now().toString(),
      stars: 5,
      productImages: []),
];

int currentColorIndex = 0;
int currentSizeIndex = 0;
bool selectedColor = true;
bool selectedSize = false;
bool _isDescriptionExpanded = true;
bool _isReviewsExpanded = true;
bool _isSimilarProductsExpanded = true;
bool favorite = false;

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // int? sizeLength = widget.data.sizes?.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: BottomAppBar(
        padding: EdgeInsets.zero,
        color: Colors.white,
        // shape: BoxShape.rectangle,
        child: Container(
          width: double.infinity,
          height: 40,
          decoration: const BoxDecoration(
              color: Color(0xff343434),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                SecondaryIcons.bag,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Add To Cart",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ClipRRect(
              child: Image.network(
                  //  width:375,
                  //  height:400,
                  widget.data.imageUrl ?? ""
                  // "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?auto=format&fit=crop&q=60&w=500&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2xvdGhpbmclMjBtb2RlbCUyMHBvc2V8ZW58MHx8MHx8fDA%3D"

                  ),
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
                      onPressed: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      icon: Icon(
                        PrimaryIcons.heart,
                        size: 19,
                        color: favorite
                            ? const Color(0xffFF6E6E)
                            : const Color(0xffD8D8D8),
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
                                  Text(
                                    widget.data.productName ?? "",
                                    style: const TextStyle(
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
                              Text(
                                "\$${widget.data.price}",
                                style: const TextStyle(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //* select color
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: const Text(
                                      "Color",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff777E90)),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      for (int i = 0;
                                          i < colorsIsSelected.length;
                                          i++)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              // colorsIsSelected[i]
                                              //         .selectedColor =
                                              //     !colorsIsSelected[i]
                                              //         .selectedColor;
                                              currentColorIndex = i;
                                              // !colorsIsSelected[i][1];
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Stack(
                                              children: [
                                                Material(
                                                  // shape: const CircleBorder(side:  BorderSide(width: 1) ),
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  // elevation: 2,
                                                  child: Container(
                                                      // color: Colors.white,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              width:
                                                                  currentColorIndex ==
                                                                          i
                                                                      ? 3
                                                                      : 0,
                                                              color:
                                                                  Colors.white),
                                                          boxShadow: [
                                                            currentColorIndex == i
                                                                ? BoxShadow(
                                                                    blurRadius:
                                                                        6,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400,
                                                                    offset:
                                                                        const Offset(
                                                                            0.001,
                                                                            6),
                                                                    spreadRadius:
                                                                        0.5)
                                                                : const BoxShadow()
                                                          ]),
                                                      child: CircleAvatar(
                                                        radius: 12,
                                                        backgroundColor: Color(
                                                            colorsIsSelected[i]
                                                                .color),
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ],
                              ),

                              //* select size
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ignore: prefer_const_constructors
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: const Text(
                                      "Size",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff777E90)),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      for (int i = 0;
                                          i < widget.data.sizes!.length;
                                          i++)
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              currentSizeIndex = i;
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  currentSizeIndex == i
                                                      ? const Color(0xff515151)
                                                      : const Color(0xffFAFAFA),
                                              child: Text(
                                                widget.data.sizes![i],
                                                style: TextStyle(
                                                    color: selectedSize
                                                        ? const Color(
                                                            0xffFAFAFA)
                                                        : const Color(
                                                            0xffC5C5C5)),
                                              ),
                                            ),
                                          ),
                                        )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Color(0xffF3F3F6),
                          ),

                          //*<-----------------------Description Section------------------------->

                          ProductDetailsExpansionPanel(
                            expansionCallback: (p0, p1) {
                              setState(() {
                                _isDescriptionExpanded =
                                    !_isDescriptionExpanded;
                              });
                            },
                            isExpanded: _isDescriptionExpanded,
                            headingText: "Description",
                            body: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 305,
                                  height: 90,
                                  child: Text(
                                      'Sportswear is no longer under culture, it is no longer indie or cobbled together as it once was. Sport is fashion today. The top is oversized in fit and style, may need to size down.',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            ),
                          ),

                          const Divider(
                            color: Color(0xffF3F3F6),
                          ),

                          //*<---------------------------Reviews Section------------------------->
                          ProductDetailsExpansionPanel(
                            expansionCallback: (p0, p1) {
                              setState(() {
                                _isReviewsExpanded = !_isReviewsExpanded;
                              });
                            },
                            isExpanded: _isReviewsExpanded,
                            headingText: "Reviews",
                            body: Column(
                              children: [
                                //? AVERAGE RATINGS-------------------------->
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Text('4.9',
                                              style: TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.w700)),
                                        ),
                                        Text('OUT OF 5',
                                            style: TextStyle(
                                                color: Color(0XFF8A8A8F),
                                                fontSize: 11,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                                        const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text('83 ratings',
                                              style: TextStyle(
                                                  color: Color(0XFF8A8A8F),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // for (int i = 0; i < ratingData.length;i++)

                                ListView.builder(
                                  itemCount: ratingData.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) =>
                                      ProductRatingProgressBar(
                                    percentage: ratingData[index][2],
                                    starNumber: ratingData[index][0],
                                    value: ratingData[index][1],
                                  ),
                                ),

                                const Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("47 Reviews",
                                          style: TextStyle(
                                              color: Color(0xff8A8A8F),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      Row(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 4.0),
                                            child: Text("WRITE A REVIEW",
                                                style: TextStyle(
                                                    color: Color(0xff8A8A8F),
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ),
                                          Icon(
                                            SecondaryIcons.pen_rounded,
                                            weight: 100,
                                            size: 16,
                                            fill: 1.0,
                                            color: Color(0xffC8C7CC),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                    itemCount: reviews.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      var data = reviews[index];
                                     return  ProductReviewsTile(
                                        data: data,
                                      );
                                    }

                                    // ProductReviewsTile(data: reviews,)
                                    ),
                              ],
                            ),
                          ),
                          const Divider(
                            color: Color(0xffF3F3F6),
                          ),

                          ProductDetailsExpansionPanel(
                              expansionCallback: (p0, p1) {
                                setState(() {
                                  _isSimilarProductsExpanded =
                                      !_isSimilarProductsExpanded;
                                });
                              },
                              isExpanded: _isSimilarProductsExpanded,
                              headingText: "Similar Product",
                              body: ProductListViewBuilder(
                                items: recomendationsList,
                              )),

                          //Divider
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
