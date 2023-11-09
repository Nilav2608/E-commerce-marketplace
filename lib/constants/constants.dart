import 'package:flutter/widgets.dart';
import 'package:fluxestore/data/myOrderStatus_data.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
import 'package:fluxestore/presentation/pages/account.dart';
import 'package:fluxestore/presentation/pages/home.dart';
import 'package:fluxestore/presentation/pages/my_orders.dart';
import 'package:fluxestore/presentation/pages/search.dart';
import 'package:fluxestore/presentation/reuseables/myOrdersList.dart';

const List<String> appBarText = [
  "Fluxestore",
  "Search",
  "My Orders",
  "Account"
];

const List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      icon: Icon(
        PrimaryIcons.home,
      ),
      label: "Home"),
  BottomNavigationBarItem(icon: Icon(PrimaryIcons.search), label: "Search"),
  BottomNavigationBarItem(
      icon: Icon(
        PrimaryIcons.shop,
      ),
      label: "Shop"),
  BottomNavigationBarItem(icon: Icon(PrimaryIcons.profile), label: "Account"),
];

const List<Widget> pages = [
  HomePage(),
  SearchPage(),
  MyOrdersPage(),
  AccountPage(),
];

List<Widget> myOrderStatusContainer = [
  OrdersList(items: pendingItems),
  OrdersList(items: deliveredItems),
  OrdersList(items: cancelledItems),
];
