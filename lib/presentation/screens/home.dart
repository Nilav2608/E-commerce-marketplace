import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
import 'package:fluxestore/presentation/components/circle_tabs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: 15,),
                    CircleTab(
                      icon: PrimaryIcons.vector,
                      isSelected: true,
                      data: "Women",
                      // iconSize: 20,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    CircleTab(
                      icon: PrimaryIcons.vector_1,
                      isSelected: false,
                      data: "Men",
                      // iconSize: 20,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    CircleTab(
                      icon: PrimaryIcons.vector_2,
                      isSelected: false,
                      data: "Accessories",
                      // iconSize: 20,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    CircleTab(
                      icon: PrimaryIcons.group_33110,
                      isSelected: false,
                      data: "Beauty",
                      // iconSize: 20,
                    ),
                  
                  ],
                )
              ],
            )),
      ),
    );
  }
}
