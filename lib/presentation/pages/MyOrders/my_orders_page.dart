import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/constants/constants.dart';
import 'package:fluxestore/presentation/pages/MyOrders/bloc/orders_page_bloc.dart';
import 'package:fluxestore/presentation/pages/MyOrders/my_orders_list.dart';
import '../../reuseables/my_orders_catagory_card.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});
  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

int tabIndex = 0;
PageController _pageController = PageController();
final MyOrdersPageBloc myOrdersPagebloc = MyOrdersPageBloc();

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  void initState() {
    super.initState();
    myOrdersPagebloc.add(OrdersPageInitialEvent(userId: email));
  }

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
      body: BlocConsumer<MyOrdersPageBloc, MyOrdersPageState>(
        bloc: myOrdersPagebloc,
        listenWhen: (previous, current) => current is OrdersPageActionState,
        buildWhen: (previous, current) => current is! OrdersPageActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case OrdersPageSuccessState:
              final successState = state as OrdersPageSuccessState;
              List<Widget> myOrderStatusContainer = [
                OrdersList(items: successState.pendingOrders),
                OrdersList(items: successState.deliveredOrders),
                OrdersList(items: successState.cancelledOrders),
              ];

              return Padding(
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
                                curve: Curves.linear,
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
                          // physics: const NeverScrollableScrollPhysics(),
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
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
