import 'package:flutter/material.dart';


import 'ChekoutStatusItemsView.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Check Out",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700
              )
            ),
      ),
      body:   const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChekoutStatusItemsView(
            initState: true,
            shippingAddressState: false, 
            paymentState: false, 
            completedState: false,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
              
              children:  [
                
                Text(
                  "STEP 1",
                  style: TextStyle(
                      color: Color(0xff1D1F22),
                      fontSize: 11,
                      fontWeight: FontWeight.w400
                    )
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
