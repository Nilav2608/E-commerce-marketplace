import 'package:flutter/material.dart';
import 'package:fluxestore/data/my_order_status_data.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
import 'package:fluxestore/presentation/Icons/secondary_icons_icons.dart';
import 'package:fluxestore/presentation/pages/account.dart';
import 'package:fluxestore/presentation/pages/cart_page.dart';
import 'package:fluxestore/presentation/pages/home.dart';
import 'package:fluxestore/presentation/pages/search.dart';
import '../presentation/pages/MyOrders/my_orders_list.dart';

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

const List<Widget> pages = [
  HomePage(),
  SearchPage(),
  CartPage(),
  AccountPage(),
];

List<Widget> myOrderStatusContainer = [
  OrdersList(items: pendingItems),
  OrdersList(items: deliveredItems),
  OrdersList(items: cancelledItems),
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