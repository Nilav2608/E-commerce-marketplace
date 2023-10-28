import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxestore/models/productModel.dart';

class ProductCardTile extends StatelessWidget {
  final ProducDatatModel product;
  const ProductCardTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            width: 126,
            height: 172,
            child: ClipRRect(
              child: SvgPicture.network(product.imageUrl.toString()),
            ),
            
          )
        ],
      ),
    );
  }
}
