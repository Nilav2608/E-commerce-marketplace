import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:fluxestore/data/banner_carosal_list.dart';

// ignore: must_be_immutable
class CurosalSliderWidget extends StatefulWidget {
  // final double contentWidth;
  // final double contentHeight;
  const CurosalSliderWidget({
    super.key,
    //  required this.contentWidth,
    // required this.contentHeight
  });

  @override
  State<CurosalSliderWidget> createState() => _CurosalSliderWidgetState();
}

class _CurosalSliderWidgetState extends State<CurosalSliderWidget> {
  final CarouselController caroselController = CarouselController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      // height: 174,
      decoration: BoxDecoration(
          // color: Colors.grey.shade600,
          borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CarouselSlider(
              carouselController: caroselController,
              items: items
                  .map(
                    (e) => InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("viewCollections", arguments: e);
                      },
                      child: Stack(children: [
                        Image.network(e.imagePath,
                            fit: BoxFit.cover,
                            // width: 412
                            width: double.infinity),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 116,
                                  height: 93,
                                  child: Text(
                                    e.text,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ]),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  viewportFraction: 1,
                  autoPlay: true,
                  aspectRatio: 16 / 9)),
        ),
        Positioned(
            bottom: 20, // Adjust the position as needed
            left: 10,
            right: 10,
            child: Center(
              child: CarouselIndicator(
                index: pageIndex,
                cornerRadius: 10,
                width: 5,
                height: 5,
                activeColor: Colors.white,
                color: Colors.grey,
                count: 3,
              ),
            ))
      ]),
    );
  }
}
