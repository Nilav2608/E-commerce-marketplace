import 'package:flutter/material.dart';
import '../models/tab_catagory_model.dart';
import '../models/user_data_model.dart';
import '../utils/icons_constants/primary_icons_icons.dart';
import '../utils/icons_constants/secondary_icons_icons.dart';

const List<String> appBarText = ["Fluxestore", "Search", "Cart", "Account"];

const List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: Icon(
        PrimaryIcons.home,
      ),
      label: "Home"),
  BottomNavigationBarItem(icon: Icon(PrimaryIcons.search), label: "Search"),
  BottomNavigationBarItem(
      icon: Icon(
        SecondaryIcons.cart_outlined,
      ),
      label: "Shop"),
  BottomNavigationBarItem(icon: Icon(PrimaryIcons.profile), label: "Account"),
];

late  String userId;
late  String email;
UserModel? user;


List<TabCategoryModel> categoryList = [
  TabCategoryModel("Pending", true),
  TabCategoryModel("Delivered", false),
  TabCategoryModel("Cancelled", false),
];
//  MyOrdersDataModel myOrdersDataMapper(
//       List<CartItemsModel> cartItems, double subTotal) {
//     List<CartItemsModel> selectedItems = [];
//     int totalQuantity = 0;
//     for (int i = 0; i < cartItems.length; i++) {
//       if (cartItems[i].selected!) {
//         selectedItems.add(cartItems[i]);
//       }
//     }
//     for (var i = 0; i < selectedItems.length; i++) {
//       totalQuantity += selectedItems[i].quantity!;
//     }
//     return MyOrdersDataModel(
//         date: DateTime.now().toString(),
//         deliveryAddress: DeliveryAddress(),
//         deliveryStatus: "PENDING",
//         orderID: "5555",
//         orderedItems: selectedItems,
//         quantity: totalQuantity,
//         shippingCharges: 0.00,
//         subTotal: subTotal,
//         total: subTotal,
//         trackingNumber: "IK987362341");
//   }