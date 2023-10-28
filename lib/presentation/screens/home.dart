import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
import 'package:fluxestore/presentation/components/home_utils/circle_tabs.dart';
import 'package:fluxestore/presentation/components/home_utils/curosal_slider.dart';
import 'package:fluxestore/presentation/components/home_utils/listViewBuilder.dart';
import 'package:fluxestore/presentation/components/home_utils/product_list_card.dart';
import 'package:fluxestore/presentation/components/home_utils/row_heading_seemore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
              Row(
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
             SizedBox(
                  height: 20,
                ),
              CurosalSliderWidget(),
             SizedBox(
                  height: 20,
                ),
             RowHeadsSeeMore(
                    text1: "Feature Products", text2: "Show all"),
             SizedBox(
                  height: 20,
                ),
                //  Container(
                //   height: 221,
                //   child: SingleChildScrollView(
                //     scrollDirection: Axis.horizontal,
                //     child: ProductListViewBuilder()),
                // )

                 ProductListViewBuilder(),
                 ProductListViewBuilder(),
              ],
            )),
      ),
    );
  }
}
