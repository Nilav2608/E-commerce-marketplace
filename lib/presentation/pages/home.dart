import 'package:flutter/material.dart';
import 'package:fluxestore/data/products_data.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
import 'package:fluxestore/presentation/reuseables/banner_cards.dart';
import 'package:fluxestore/presentation/reuseables/circle_tabs.dart';
import 'package:fluxestore/presentation/home_utils/curosal_slide_widget_banner.dart';
import 'package:fluxestore/presentation/home_utils/listViewBuilder.dart';
import 'package:fluxestore/presentation/reuseables/recommended_products_ListTile.dart';
import 'package:fluxestore/presentation/reuseables/row_heading_seemore.dart';
import 'package:fluxestore/presentation/home_utils/vertical_banner_last.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//horizontal: 25, vertical: 15
class _HomePageState extends State<HomePage> {
  double hori = 25;
  double vert = 15;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
              child: const SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // SizedBox(width: 15,),
                    CircleTab(
                      icon: PrimaryIcons.vector,
                      isSelected: true,
                      data: "Women",
                      // iconSize: 20,
                    ),
                    // SizedBox(
                    //   width: 35,
                    // ),
                    CircleTab(
                      icon: PrimaryIcons.vector_1,
                      isSelected: false,
                      data: "Men",
                      // iconSize: 20,
                    ),
                    // SizedBox(
                    //   width: 35,
                    // ),
                    CircleTab(
                      icon: PrimaryIcons.glasses,
                      isSelected: false,
                      data: "Accessories",
                      // iconSize: 20,
                    ),
                    // SizedBox(
                    //   width: 35,
                    // ),
                    CircleTab(
                      icon: PrimaryIcons.group_33110,
                      isSelected: false,
                      data: "Beauty",
                      // iconSize: 20,
                    ),
                  ],
                ),
              ),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
              child: const CurosalSliderWidget(),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
              child: const RowHeadsSeeMore(
                  text1: "Feature Products", text2: "Show all"),
            ),
            // SizedBox(
            //   height: 15,
            // ),
             ProductListViewBuilder(items: productsList),
            const BannerCards(
                width: 400,
                height: 162,
                //  right: 20,
                top: 30,
                left: 35,
                right: 20,
                bottom: 0,
                liteText: "| NEW COLLECTION",
                mainText: "HANG OUT & PARTY",
                // imagePath: "assets/images/glassGirl.svg"
                imagePath: "assets/images/glass.png"),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
              child: const RowHeadsSeeMore(
                  text1: "Recommended", text2: "Show all"),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            const RecomendedProductsListTile(),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
              child: const RowHeadsSeeMore(
                  text1: "Top Collection", text2: "Show all"),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
              child: const BannerCards(
                  width: 312,
                  height: 158,
                  //  right: 20,
                  top: 20,
                  left: 20,
                  right: 10,
                  bottom: 10,
                  liteText: "| SALE UPTO 40%",
                  mainText: "FOR SLIM & BEAUTY",
                  // imagePath: "assets/images/glassGirl.svg"
                  imagePath: "assets/images/yellow.png"),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
              child: const BannerCards(
                width: 312,
                height: 210,
                // right: 20,
                top: 35,
                left: 20,
                right: 0,
                bottom: 10,
                liteText: "| WINTER COLLECTION ",
                mainText: "Most sexy & fabulous design ",
                // imagePath: "assets/images/glassGirl.svg"
                imagePath: "assets/images/coatNew.png",
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hori, vertical: vert),
              child: const VerticalCards(),
            )
          ],
        ),
      ]),
    );
  }
}
