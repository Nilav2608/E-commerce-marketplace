import 'package:flutter/material.dart';
import 'package:fluxestore/models/productModel.dart';
import 'package:fluxestore/presentation/reuseables/product_list_tile.dart';

class ProductListViewBuilder extends StatelessWidget {
  final dynamic items;
  const ProductListViewBuilder({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // physics: ,
        itemCount: items.length,
        itemBuilder: (context, index) {
          ProducDatatModel producData = items[index];
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 0),
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("productDetails",arguments: producData);
                },
                child: ProductCardTile(product: producData),
              ),
          );
        },
      ),
    );
  }
}
