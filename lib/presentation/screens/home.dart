import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: const [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      // SizedBox(width: 15,),
                      CircleTab(
                        icon: PrimaryIcons.vector,
                        isSelected: true,
                        data: "Women",
                        // iconSize: 20,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      CircleTab(
                        icon: PrimaryIcons.vector_1,
                        isSelected: false,
                        data: "Men",
                        // iconSize: 20,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      CircleTab(
                        icon: PrimaryIcons.glasses,
                        isSelected: false,
                        data: "Accessories",
                        // iconSize: 20,
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      CircleTab(
                        icon: PrimaryIcons.group_33110,
                        isSelected: false,
                        data: "Beauty",
                        // iconSize: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CurosalSliderWidget(),
                SizedBox(
                  height: 20,
                ),
                RowHeadsSeeMore(text1: "Feature Products", text2: "Show all"),
                ProductListViewBuilder(),
                BannerCards(
                    width: 312,
                    height: 158,
                    liteText: "| NEW COLLECTION",
                    mainText: "HANG OUT & PARTY",
                    // imagePath: "assets/images/glassGirl.svg"
                    imagePath: "assets/images/glass.png"),
                SizedBox(
                  height: 20,
                ),
                RowHeadsSeeMore(text1: "Recommended", text2: "Show all"),
                SizedBox(
                  height: 20,
                ),
                RecomendedProductsListTile(),
               
                SizedBox(
                  height: 20,
                ),
                RowHeadsSeeMore(text1: "Top Collection", text2: "Show all"),
                SizedBox(
                  height: 20,
                ),
                BannerCards(
                    width: 312,
                    height: 158,
                    liteText: "| SALE UPTO 40%",
                    mainText: "FOR SLIM & BEAUTY",
                    // imagePath: "assets/images/glassGirl.svg"
                    imagePath: "assets/images/yellow.png"
                ),
                SizedBox(
                  height: 20,
                ),
                BannerCards(
                    width: 312,
                    height: 210,
                    liteText: "| WINTER COLLECTION ",
                    mainText: "FOR SLIM & BEAUTY",
                    // imagePath: "assets/images/glassGirl.svg"
                    imagePath: "assets/images/coatNew.png"
                ),
                SizedBox(
                  height: 20,
                ),
                VerticalCards()
              ],
            )),
      ]),
    );
  }
}
