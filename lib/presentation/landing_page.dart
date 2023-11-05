import 'package:flutter/material.dart';
import 'package:fluxestore/Business_Logic/bloc/landing_page_bloc.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/presentation/home_utils/drawer.dart';
import 'package:fluxestore/presentation/pages/home.dart';
import 'package:fluxestore/presentation/pages/search.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final LandingPageBloc landingPageBloc = LandingPageBloc();
    return BlocConsumer<LandingPageBloc, LandingPageInitial>(
        bloc: landingPageBloc,
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: const Center(
                    child: Text(
                  "FluxeStore",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                )),
                // backgroundColor: const Color.fromARGB(0, 165, 24, 24),
                elevation: 0,
                leading: Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: const Icon(
                          Icons.menu_rounded,
                          grade: 10,
                        )),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "notifications");
                        },
                        icon: const Icon(PrimaryIcons.bell_pin)),
                  )
                ],
              ),
              drawer: const HomeDrawer(),
              bottomNavigationBar: BottomNavigationBar(
                items: bottomNavItems,
                currentIndex: state.tabIndex,
                selectedItemColor: const Color.fromARGB(255, 0, 0, 0),
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                elevation: 10,
                onTap: (index) {
                  landingPageBloc
                      .add(LandingPageTabChangeEvent(tabIndex: index));
                },
              ),
              body: pages[state.tabIndex]);
        });
  }

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
}

// If image looks not as expected please convert to compound path manually.

// Skipped tags and attributes: stroke-width,stroke-linecap,stroke-linejoin,stroke


