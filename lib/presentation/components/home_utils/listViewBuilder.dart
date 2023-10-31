import 'package:flutter/material.dart';
import 'package:fluxestore/data/products_data.dart';
import 'package:fluxestore/models/productModel.dart';
import 'package:fluxestore/presentation/components/home_utils/product_list_card.dart';

class ProductListViewBuilder extends StatelessWidget {
  const ProductListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      
      width: 340,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // physics: ,
        itemCount: productsList.length,
        itemBuilder: (context, index) {
          ProducDatatModel data = productsList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductCardTile(product: data),
          );
        },
      ),
    );
  }
}
