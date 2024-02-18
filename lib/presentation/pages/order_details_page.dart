import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';

class OrderDetailsPage extends StatefulWidget {
  final MyOrdersDataModel data;
  const OrderDetailsPage({super.key, required this.data});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

bool isCancelling = true;

cancelDialog(context, String orderId) {
  return showDialog(
      context: context,
      builder: (context) =>
          // isCancelling
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          AlertDialog(
            title: const Text('Cancel Order'),
            content:
                Text('Are you sure you want to cancel this order? #$orderId'),
            actions: [
              TextButton(
                onPressed: () {
                  // User clicked on "Cancel" button
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                  await Future.delayed(const Duration(seconds: 2));

                  Navigator.of(context).popUntil((route) => route.isFirst);

                  // Alternatively, you can use popUntil with a specific route
                  // Navigator.of(context).popUntil(ModalRoute.withName('MyOrders'));
                },
                child: const Text('Confirm'),
              ),
            ],
          ));
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order ${widget.data.orderID}",
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              widget.data.deliveryStatus == "PENDING"
                  ? Container(
                      width: double.infinity,
                      height: 92,
                      decoration: BoxDecoration(
                          color: const Color(0xff575757),
                          borderRadius: BorderRadius.circular(10)),
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    "Your order is on the way",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "Click here to track your order",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SvgPicture.asset("assets/images/Frame.svg")
                          ],
                        ),
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      height: 92,
                      decoration: BoxDecoration(
                          color: const Color(0xff575757),
                          borderRadius: BorderRadius.circular(10)),
                      // ignore: prefer_const_constructors
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: Text(
                                    "Your order is delivered",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Text(
                                  "Rate product to get 5 points for collect.",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SvgPicture.asset("assets/images/delivered.svg")
                          ],
                        ),
                      ),
                    ),
              const SizedBox(
                height: 20,
              ),
              //*Order Details--------------------------------------------------->
              Container(
                width: double.infinity,
                height: 114,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(3, 1))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Order number ",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(98, 20, 33, 128),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            widget.data.orderID ?? "",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff141416),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Tracking number ",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(98, 20, 33, 128),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            widget.data.trackingNumber ?? "",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff141416),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Delivary address ",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(97, 96, 97, 109),
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 100),
                          Expanded(
                            child: Text(
                              "${widget.data.deliveryAddress!.street ?? ''}, ${widget.data.deliveryAddress!.city ?? ''}",
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff141416),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //*Bill------------------------------------------------------------>
              Container(
                width: double.infinity,
                // height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xffe8e8e8),
                        blurRadius: 10.0,
                        offset: Offset(0, 1))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LimitedBox(
                        child: ListView.builder(
                            itemCount: widget.data.orderedItems!.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var itemsData = widget.data.orderedItems![index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    itemsData.productName ?? "",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff141416),
                                        fontWeight: FontWeight.w100),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "x${itemsData.quantity.toString()}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff141416),
                                            fontWeight: FontWeight.w100),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Text(
                                        "\$${itemsData.price}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff141416),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Sub Total",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff141416),
                                fontWeight: FontWeight.w100),
                          ),
                          Text(
                            widget.data.subTotal.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff141416),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Shipping",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff141416),
                                fontWeight: FontWeight.w100),
                          ),
                          Text(
                            widget.data.shippingCharges.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff141416),
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const Divider(color: Color(0xffF3F3F6)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff141416),
                                  fontWeight: FontWeight.w100),
                            ),
                            Text(
                              "\$${widget.data.total}",
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff141416),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              widget.data.deliveryStatus == "PENDING"
                  ?
                  //*Continue to shopping page--------------------------------------->
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 48,
                          // width: 170,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil('/',(Route<dynamic> route) => false);
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFF343434))),
                              child: const Text(
                                "Continue shopping",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        ),
                        SizedBox(
                          height: 48,
                          width: 142,
                          child: OutlinedButton(
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                                await Future.delayed(
                                    const Duration(seconds: 2));

                                // ignore: use_build_context_synchronously
                                cancelDialog(
                                    context, '#${widget.data.orderID}');
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1.0, color: Color(0xFFC50000)),
                              ),
                              child: const Text(
                                "Cancel Order",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFC50000)),
                              )),
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 44,
                          width: 168,
                          child: OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamedAndRemoveUntil('/',(Route<dynamic> route) => false);
                              },
                              child: const Text("Return home",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff777E90),
                                      fontWeight: FontWeight.w700))),
                        ),
                        SizedBox(
                          height: 44,
                          width: 119,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('productFeedbackPage');
                              },
                              style: const ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Color(0xFF343434))),
                              child: const Text(
                                "Rate",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
