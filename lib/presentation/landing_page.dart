import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluxestore/Business_Logic/bloc/landing_page_bloc.dart';
import 'package:fluxestore/constants/constants.dart';
import 'package:fluxestore/presentation/Icons/primary_icons_icons.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/presentation/home_utils/drawer.dart';

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
                title: Center(
                    child: Text(
                  state.appBarName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                )),
                // backgroundColor: const Color.fromARGB(0, 165, 24, 24),
                elevation: 0,
                leading: Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: SvgPicture.asset("assets/images/menu.svg")
                        // icon: const ImageIcon(
                        //   AssetImage('assets/images/more.png')
                        // ),
                        // icon: const Icon(
                        //   Icons.menu_rounded,
                        //   grade: 10,
                        // )
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
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
                  var appBartext = appBarText[index];
                  landingPageBloc.add(LandingPageTabChangeEvent(
                      tabIndex: index, appBarName: appBartext));
                },
              ),
              body: pages[state.tabIndex]);
        });
  }
}

// If image looks not as expected please convert to compound path manually.

// Skipped tags and attributes: stroke-width,stroke-linecap,stroke-linejoin,stroke


