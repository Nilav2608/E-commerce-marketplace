import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxestore/models/productModel.dart';

class ProductCardTile extends StatelessWidget {
  final ProducDatatModel product;
  const ProductCardTile({super.key, required this.product});

  @override
 Widget build(BuildContext context) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          clipBehavior: Clip.antiAliasWithSaveLayer, // Add border radius
          child: SizedBox(
            width: 126,
            height: 172,
             
            child: Image.network(
              product.imageUrl.toString(),
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          product.productName.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        Text(
          "\$${product.price}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

}
