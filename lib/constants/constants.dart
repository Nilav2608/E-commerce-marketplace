import 'package:flutter/material.dart';
import 'package:fluxestore/data/myOrderStatus_data.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
import 'package:fluxestore/presentation/Icons/secondary_icons_icons.dart';
import 'package:fluxestore/presentation/pages/account.dart';
import 'package:fluxestore/presentation/pages/cart_page.dart';
import 'package:fluxestore/presentation/pages/home.dart';
import 'package:fluxestore/presentation/pages/search.dart';

import '../presentation/pages/MyOrders/myOrdersList.dart';

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
