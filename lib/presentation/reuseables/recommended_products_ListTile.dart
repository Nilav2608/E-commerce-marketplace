import 'package:flutter/material.dart';
import 'package:fluxestore/data/products_data.dart';
import 'package:fluxestore/models/ProducDatatModel.dart';

class RecomendedProductsListTile extends StatelessWidget {
  const RecomendedProductsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendedList.length,
        itemBuilder: (context, index) {
          ProducDatatModel productData = recommendedList[index];
          return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("productDetails",arguments: productData);
              },
              child: RecomendedTileWidget(list: productData));
        },
      ),
    );
  }
}

class RecomendedTileWidget extends StatelessWidget {
  const RecomendedTileWidget({
    super.key,
    required this.list,
  });

  final ProducDatatModel list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
          width: 213,
          // height: 66,
          decoration: BoxDecoration(
            color: const Color.fromARGB(26, 251, 251, 251),
            border: Border.all(width: 2.0, color: const Color(0xffF9F9F9)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  // fit:BoxFit.fill,
                  child: Image(
                    height: 76,
                    image: NetworkImage(
                      list.imageUrl ?? "",
                    ),
                    fit: BoxFit.cover,
                  )),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    list.productName ?? "",
                    style:
                        const TextStyle(fontSize: 12, color: Color(0xff1D1F22)),
                  ),
                  Text(
                    "\$${list.price ?? ""}",
                    style: const TextStyle(
                        // fontWeight: FontWeight.w800,
                        fontSize: 18,
                        color: Color(0xff1D1F22)),
                  )
                ],
              )
            ],
          )),
    );
  }
}



// [
//       BoxShadow(
//         color: Colors.grey, // Shadow color
//         offset: Offset(0, 4), // Offset of the shadow (horizontal, vertical)
//         blurRadius: 5, // Spread of the shadow
//         spreadRadius: 0, // Optional: Spread the shadow
//       ),
//     ],