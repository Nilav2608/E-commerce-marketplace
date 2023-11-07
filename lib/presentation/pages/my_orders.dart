import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/reuseables/MyOrderDetailsCard.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryCard(
                        category: categoryList[index],
                        onPressed: (b) {
                          for (var category in categoryList) {
                            category.isSelected = false;
                          }
                          setState(() {
                            categoryList[index].isSelected = true;
                          });
                        },
                      ),
                    );
                  },
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical:8.0),
                  child: MyOrderDetailsCard(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Category {
  final String title;
  bool isSelected;
  Category(this.title, this.isSelected);
}

List<Category> categoryList = [
  Category("Pending", true),
  Category("Delivered", false),
  Category("Cancelled", false),
];

class CategoryCard extends StatefulWidget {
  final Category category;
  final Function(bool) onPressed;

  const CategoryCard(
      {required this.category, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91,
      height: 32,
      // padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: widget.category.isSelected
              ? const Color(0xff43484B)
              : Colors.white),
      child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: () {
            widget.onPressed(true);
          },
          child: Text(widget.category.title,
              style: TextStyle(
                  color: widget.category.isSelected
                      ? Colors.white
                      : Colors.black))),
    );
  }
}


//DefaultTabController(
    //     length: 3,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         backgroundColor: Colors.white,
    //         elevation: 0,
    //         bottom: TabBar(
    //             unselectedLabelColor: Colors.redAccent,
    //             indicatorSize: TabBarIndicatorSize.tab,
    //             indicator: BoxDecoration(
    //                 gradient: const LinearGradient(
    //                     colors: [Colors.redAccent, Colors.orangeAccent]),
    //                 borderRadius: BorderRadius.circular(50),
    //                 color: Colors.redAccent),
    //             tabs: const [
    //               Tab(
    //                 child: Align(
    //                   alignment: Alignment.center,
    //                   child: Text("APPS"),
    //                 ),
    //               ),
    //               Tab(
    //                 child: Align(
    //                   alignment: Alignment.center,
    //                   child: Text("MOVIES"),
    //                 ),
    //               ),
    //               Tab(
    //                 child: Align(
    //                   alignment: Alignment.center,
    //                   child: Text("GAMES"),
    //                 ),
    //               ),
    //             ]),
    //       ),
    //       body: const TabBarView(children: [
    //         Icon(Icons.apps),
    //         Icon(Icons.movie),
    //         Icon(Icons.games),
    //       ]),
    //     )
    //  );