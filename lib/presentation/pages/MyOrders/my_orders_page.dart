import 'package:flutter/material.dart';
import 'package:fluxestore/constants/constants.dart';
import 'package:fluxestore/models/tab_catagory_model.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

int tabIndex = 0;
PageController _pageController = PageController();

// @override
// void initState() {

//   super.initState();

// }

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Orders",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 4,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                    decelerationRate: ScrollDecelerationRate.normal),
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    category: categoryList[index],
                    onPressed: (b) {
                      for (var category in categoryList) {
                        category.isSelected = false;
                      }
                      setState(() {
                        categoryList[index].isSelected = true;
                        tabIndex = index;
                      });
                      _pageController.animateToPage(
                        tabIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                      // print(tabIndex);
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                height: double.infinity,
                child: PageView.builder(
                  itemCount: 3,
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [myOrderStatusContainer[tabIndex]],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<TabCategoryModel> categoryList = [
  TabCategoryModel("Pending", true),
  TabCategoryModel("Delivered", false),
  TabCategoryModel("Cancelled", false),
];

class CategoryCard extends StatelessWidget {
  final TabCategoryModel category;
  final Function(bool) onPressed;

  const CategoryCard(
      {required this.category, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(true);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Container(
            width: MediaQuery.of(context).size.width * 0.25,
            height: 26,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: category.isSelected
                    ? const Color(0xff43484B)
                    : Colors.white),
            child: Center(
              child: Text(category.title,
                  style: TextStyle(
                      color:
                          category.isSelected ? Colors.white : Colors.black)),
            )),
      ),
    );
  }
}
