import 'package:flutter/material.dart';
import 'package:fluxestore/Business_Logic/CartPage/cart_page_bloc.dart';
import 'package:fluxestore/data/cart_items.dart';
import 'package:fluxestore/presentation/reuseables/Cart_Product_Tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    super.initState();
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
            return Scaffold(
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Product price",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff8A8A8F),
                              ),
                            ),
                            Text(
                              "\$110",
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
                      //* Shipping Details
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Sub Total",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "\$110",
                              style: TextStyle(
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
                              Navigator.pushNamed(context, "checkOut");
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
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          var itemsData = cartItems[index];
                          return CartProductTile(
                            // quantity: itemsData.quantity!,
                            data: itemsData,
                            onIncrease: () {
                              setState(() {
                                // Increment the quantity of the specific product
                                itemsData.quantity =
                                    (itemsData.quantity ?? 0) + 1;
                              });
                            },
                            onDecrease: () {
                              setState(() {
                                // Decrease the quantity of the specific product (if greater than 1)
                                if (itemsData.quantity! > 1) {
                                  itemsData.quantity = itemsData.quantity! - 1;
                                }
                              });
                            },
                            delete: (context) {
                              cartPageBloc.add(RemoveAnItemFromCartEvent(
                                  product: itemsData));
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
