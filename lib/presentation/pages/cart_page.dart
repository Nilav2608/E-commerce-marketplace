import 'package:flutter/material.dart';
import 'package:customizable_counter/customizable_counter.dart';
import 'package:fluxestore/presentation/reuseables/Cart_Product_Tile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

int quantity = 1;

increaseQuantity() {
  quantity++;
}

decreaseQuantity() {
  if (quantity > 1) {
    quantity--;
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Cart_Product_Tile()
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return CartProductTile(
                    increment: () {
                      setState(() {
                        increaseQuantity();
                      });
                    },
                    decrement: () {
                      setState(() {
                        decreaseQuantity();
                      });
                    },
                    quantity: quantity,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
