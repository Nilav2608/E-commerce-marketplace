import 'package:flutter/material.dart';
import 'package:fluxestore/models/product_data_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Icons/primary_icons_icons.dart';

class CollectionsListTile extends StatefulWidget {
  final ProductDataModel product;

  const CollectionsListTile({
    super.key,
    required this.product,
  });

  @override
  State<CollectionsListTile> createState() => _CollectionsListTileState();
}

bool isFavorite = false;

class _CollectionsListTileState extends State<CollectionsListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
            width: 141,
            height: 186,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  // clipBehavior: Clip.hardEdge, // Add border radius
                  child: Image.network(
                    width: 141,
                    // height: 186,
                    widget.product.imageUrl.toString(),
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 27,
                        height: 27,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            style: ButtonStyle(
                              elevation: const MaterialStatePropertyAll(3),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.white),
                              shadowColor: MaterialStatePropertyAll(
                                Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            icon: Icon(
                              PrimaryIcons.heart,
                              size: 16,
                              // color: Color(0xffD8D8D8),
                              color: isFavorite
                                  ? const Color(0xffFF6E6E)
                                  : const Color(0xffD8D8D8),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            )),
        const SizedBox(height: 5),
        Text(
          // "",
          widget.product.productName.toString(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "\$${widget.product.price.toString()}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            RatingBarIndicator(
              rating: 4,
              itemBuilder: (context, index) => const Icon(
                Icons.star,
                color: Color(0xff508A7B),
              ),
              itemCount: 5,
              itemSize: 20.0,
              direction: Axis.horizontal,
            ),
            const Text(
              "(83)",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1D1F22)),
            ),
          ],
        ),
      ],
    );
  }
}
