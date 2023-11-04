import 'package:flutter/material.dart';
import 'package:fluxestore/models/productModel.dart';

class ProductCardTile extends StatelessWidget {
  final ProducDatatModel product;
  const ProductCardTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          // clipBehavior: Clip.antiAliasWithSaveLayer, // Add border radius
          child: Image.network(
            width: 126,
            height: 172,
            product.imageUrl.toString(),
            fit: BoxFit.cover, // Adjust the fit as needed
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
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
