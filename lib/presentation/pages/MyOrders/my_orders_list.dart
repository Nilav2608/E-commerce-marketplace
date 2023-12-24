import 'package:flutter/material.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/presentation/pages/MyOrders/my_order_details_card.dart';


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
              itemCount: items.length,
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
