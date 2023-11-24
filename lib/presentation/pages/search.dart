import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      width: 246,
                      height: 46,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 12,
                                color: Colors.grey,
                                offset: Offset(0, 1),
                                spreadRadius: -10),
                            // BoxShadow(
                            //   blurRadius: 10,
                            //   color: Color.fromARGB(255, 44, 40, 40),
                            //   offset: Offset(0, 2)
                            // )
                          ]),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          children: [
                            Icon(
                              PrimaryIcons.search,
                              size: 18,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    hintStyle: TextStyle(fontSize: 14),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    width: 51,
                    height: 46,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 15,
                              color: Colors.grey,
                              offset: Offset(0, 5),
                              spreadRadius: -12),
                          // BoxShadow(
                          //   blurRadius: 10,
                          //   color: Color.fromARGB(255, 44, 40, 40),
                          //   offset: Offset(0, 2)
                          // )
                        ]),
                    child: Builder(
                      builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon:
                              // SecondaryIcons.filter_outlined,
                              SvgPicture.asset("assets/images/search_filter.svg"),
                          // color: const Color(0xff777E90),
                        );
                      }
                    ))
              ],
            ),
            
            //* To USE A LIST VIEW OR LIST VIEW BUILDER INSIDE A COLUMN(NORMAL USECASE) -
            //* -USE EXPANDED WIDGET TO WRAP THE CHILD LIST VIEW

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        width: 311,
                        height: 126,
                        decoration: BoxDecoration(
                            color: const Color(0xffA3A798),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 30),
                              child: Text("CLOTHING",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 126,
                              width: 200,
                              child: Column(
                                children: [
                                  Stack(
                                    fit: StackFit.passthrough,
                                    alignment: Alignment.center,
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Color(0xFFB2B7A7),
                                        radius: 55,
                                      ),
                                      const CircleAvatar(
                                        backgroundColor: Color(0XffC2C7B5),
                                        radius: 40,
                                      ),
                                      Positioned(
                                        // top: 5,
                                        // left: 5,
                                        // right: 30,
                                        child: Image.asset(
                                          // height: 100,
                                          "assets/images/search1.png",
                                          // assets\images\search_recomend_banner1.png
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        width: 311,
                        height: 126,
                        decoration: BoxDecoration(
                            color: const Color(0xff898280),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: Text("ACCESSORIES",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0xFF938B89),
                                      radius: 55,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Color(0Xff9C9492),
                                      radius: 40,
                                    ),
                                    Image.asset(
                                      height: 80,
                                      "assets/images/search2.png",
                                      // assets\images\search_recomend_banner1.png
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        width: 311,
                        height: 126,
                        decoration: BoxDecoration(
                            color: const Color(0xff44565C),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("SHOES",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0xFF4F636A),
                                      radius: 55,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Color(0Xff5B7178),
                                      radius: 40,
                                    ),
                                    Image.asset(
                                      height: 120,
                                      "assets/images/search3.png",
                                      // assets\images\search_recomend_banner1.png
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Container(
                        width: 311,
                        height: 126,
                        decoration: BoxDecoration(
                            color: const Color(0xffB9AEB2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("COLLECTIONS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Color(0xFFC7BEC2),
                                      radius: 55,
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Color(0XffD1CACD),
                                      radius: 40,
                                    ),
                                    Image.asset(
                                      height: 126,
                                      "assets/images/search4.png",
                                      // assets\images\search_recomend_banner1.png
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Logo
            Column(
              children: [
                DrawerHeader(
                  duration: const Duration(milliseconds: 200),
                  // padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Filter"),
                      SvgPicture.asset("assets/images/search_filter.svg")
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.info_rounded,
                      color: Colors.white,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  "Log out",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
