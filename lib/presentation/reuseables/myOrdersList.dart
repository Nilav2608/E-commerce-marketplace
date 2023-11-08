import 'package:flutter/material.dart';
import 'package:fluxestore/models/MyOrdersDataModel.dart';
import 'package:fluxestore/presentation/reuseables/MyOrderDetailsCard.dart';

PageController _pageController = PageController();

class OrdersList extends StatelessWidget {
  final List<MyOrdersDataModel> items;
  const OrdersList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                var data = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MyOrderDetailsCard(
                    data: data,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
