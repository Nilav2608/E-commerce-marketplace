import 'package:flutter/material.dart';
import 'package:fluxestore/primary_icons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "FluxeStore",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold),
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
            child:
                IconButton(onPressed: () {}, icon: const Icon(PrimaryIcons.bell_pin)),
          )
        ],
      ),
      drawer: drawer(),
    );
  }

  Widget drawer() {
    return Drawer();
  }
}


// If image looks not as expected please convert to compound path manually.

// Skipped tags and attributes: stroke-width,stroke-linecap,stroke-linejoin,stroke


