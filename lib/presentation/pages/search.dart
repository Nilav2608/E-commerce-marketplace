import 'package:flutter/material.dart';
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Card(
                    // shape: Bo,
                    child: Container(
                      width: 246,
                      height: 46,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
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
                  ),
                ),
                const Card(
                  child: SizedBox(
                      width: 51,
                      height: 46,
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: Color(0xff777E90),
                      )),
                )
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Container(
                      width: 311,
                      height: 126,
                      decoration: BoxDecoration(
                          color: const Color(0xffA3A798),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("CLOTHING",style:TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                          )),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xFFB2B7A7),
                                    radius: 55,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Color(0XffC2C7B5),
                                    radius: 40,
                                  ),
                                  // Image.asset(
                                  //    height:10 ,
                                  //   "assets/images/search_banner1.png",
                                  //   // assets\images\search_recomend_banner1.png
                                  // ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Container(
                      width: 311,
                      height: 126,
                      decoration: BoxDecoration(
                          color: const Color(0xffA3A798),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("CLOTHING",style:TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                          )),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xFFB2B7A7),
                                    radius: 55,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Color(0XffC2C7B5),
                                    radius: 40,
                                  ),
                                  // Image.asset(
                                  //    height:10 ,
                                  //   "assets/images/search_banner1.png",
                                  //   // assets\images\search_recomend_banner1.png
                                  // ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Container(
                      width: 311,
                      height: 126,
                      decoration: BoxDecoration(
                          color: const Color(0xffA3A798),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("CLOTHING",style:TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                          )),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xFFB2B7A7),
                                    radius: 55,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Color(0XffC2C7B5),
                                    radius: 40,
                                  ),
                                  // Image.asset(
                                  //    height:10 ,
                                  //   "assets/images/search_banner1.png",
                                  //   // assets\images\search_recomend_banner1.png
                                  // ),
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
          ],
        ),
      ),
    );
  }
}
