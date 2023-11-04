import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:fluxestore/data/banner_carosal_list.dart';

// ignore: must_be_immutable
class CurosalSliderWidget extends StatefulWidget {
  const CurosalSliderWidget({super.key});

  @override
  State<CurosalSliderWidget> createState() => _CurosalSliderWidgetState();
}

class _CurosalSliderWidgetState extends State<CurosalSliderWidget> {
  final CarouselController caroselController = CarouselController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312,
      height: 172,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CarouselSlider(
              carouselController: caroselController,
              items: items
                  .map(
                    (e) => Stack(children: [
                      Image.network(e["image_path"],
                          fit: BoxFit.cover,
                          // width: 412
                          width: 500),
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
                                  e["text"],
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
            left: 0,
            right: 30,
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
