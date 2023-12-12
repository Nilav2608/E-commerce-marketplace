import 'package:flutter/material.dart';
import 'package:fluxestore/data/cart_items.dart';
import 'package:fluxestore/models/CartItemsModel.dart';
import 'package:fluxestore/models/MyOrdersDataModel.dart';
import 'package:fluxestore/presentation/reuseables/Cart_Product_Tile.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';

import '../../Business_Logic/CartPageBloc/cart_page_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

final CartPageBloc cartPageBloc = CartPageBloc();

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    cartPageBloc.add(CartPageInitialEvent());
    subTotal(cartItems);
    super.initState();
  }

  checkBox(bool value) {
    setState(() {
      value = !value;
    });
  }

  MyOrdersDataModel myOrdersDataMapper(
      List<CartItemsModel> cartItems, double subTotal) {
    List<CartItemsModel> selectedItems = [];
    int totalQuantity = 0;
    for (int i = 0; i < cartItems.length; i++) {
      if (cartItems[i].selected!) {
        selectedItems.add(cartItems[i]);
      }
    }
    for (var i = 0; i < selectedItems.length; i++) {
      totalQuantity += selectedItems[i].quantity!;
    }
    return MyOrdersDataModel(
        date: DateTime.now().toString(),
        deliveryAddress: "23 Main Street, City, Country",
        deliveryStatus: "PENDING",
        orderID: "5555",
        orderedItems: selectedItems,
        quantity: totalQuantity,
        shippingCharges: 0.00,
        subTotal: subTotal,
        total: subTotal,
        trackingNumber: "IK987362341");
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<CartPageBloc, CartPageState>(
      bloc: cartPageBloc,
      listenWhen: (previous, current) => current is CartPageActionState,
      buildWhen: (previous, current) => current is! CartPageActionState,
      listener: (BuildContext context, CartPageState state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case CartSuccessState:
            final successState = state as CartSuccessState;
            String total = successState.subTotal.toString();
            return successState.cartSuccessData.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Lottie.asset("assets/lottie/empty_box_lottie.json"),
                        const Text("YOUR CART IS EMPTY"),
                      ],
                    ),
                  )
                : Scaffold(
                    bottomNavigationBar: Container(
                      width: screenWidth,
                      height: screenHeight * 0.30,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xffe8e8e8),
                                blurRadius: 10.0,
                                offset: Offset(1, 0))
                          ],
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            //* Product Price
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Product price",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff8A8A8F),
                                    ),
                                  ),
                                  Text(
                                    "\$$total",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Color(0xffE8E8E8),
                            ),
                            //* Shipping Details
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Shipping",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff8A8A8F),
                                    ),
                                  ),
                                  Text(
                                    "Freeship",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Color(0xffE8E8E8),
                            ),
                            //* Sub Total
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Sub Total",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "\$$total",
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: screenWidth * 0.14,
                              width: screenHeight * 3,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (successState.subTotal != 0) {
                                      var resluts = myOrdersDataMapper(
                                          successState.cartSuccessData,
                                          successState.subTotal);
                                      Navigator.pushNamed(context, "checkOut",
                                          arguments: resluts);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              // margin: EdgeInsets.only(bottom: 100),
                                              // padding: EdgeInsets.all(10),
                                              duration:
                                                  Duration(milliseconds: 1000),
                                              behavior:
                                                  SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Color(0xFFFF8080),
                                              content: Text(
                                                "Select Atleast one item to CheckOut!",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )));
                                    }
                                  },
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Color(0xFF343434))),
                                  child: const Text(
                                    "Proceed to checkout",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Cart_Product_Tile()
                          Expanded(
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: successState.cartSuccessData.length,
                              itemBuilder: (context, index) {
                                var itemsData =
                                    successState.cartSuccessData[index];
                                return CartProductTile(
                                  data: itemsData,
                                  onIncrease: () {
                                    setState(() {
                                      // Increment the quantity of the specific product
                                      itemsData.quantity =
                                          (itemsData.quantity ?? 0) + 1;
                                    });
                                    cartPageBloc.add(CartPageInitialEvent());
                                  },
                                  onDecrease: () {
                                    setState(() {
                                      // Decrease the quantity of the specific product (if greater than 1)
                                      if (itemsData.quantity! > 1) {
                                        itemsData.quantity =
                                            itemsData.quantity! - 1;
                                      }
                                    });
                                    cartPageBloc.add(CartPageInitialEvent());
                                  },
                                  delete: (context) {
                                    cartPageBloc.add(RemoveAnItemFromCartEvent(
                                        product: itemsData));
                                  },
                                  onCheckBoxChanged: (bool? value) {
                                    itemsData.selected = value;
                                    cartPageBloc.add(CartPageInitialEvent());
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          default:
            return const SizedBox();
        }
      },
    );
  }
}

//checkBox(itemsData.selected!);
                              // cartPageBloc.add(CartPageInitialEvent());