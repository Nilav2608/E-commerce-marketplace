


import 'package:flutter/widgets.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
import 'package:fluxestore/presentation/pages/home.dart';
import 'package:fluxestore/presentation/pages/search.dart';

List<String> appBarText = ["Fluxestore", "Search", "My Orders", "Account"];

  List<BottomNavigationBarItem> bottomNavItems =
      const <BottomNavigationBarItem>[
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

  List<Widget> pages = const [
    HomePage(),
    SearchPage(),
    Center(child: Text("Comming soon ")),
    Center(
        child: Text(
      "Comming soon - Account info page",
      style: TextStyle(fontWeight: FontWeight.w400),
    )),
  ];