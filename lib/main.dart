import 'package:flutter/material.dart';
import 'package:fluxestore/landing_page.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

    TextTheme _buildTextTheme(TextTheme base) {
    return GoogleFonts.ptSansTextTheme(base).copyWith(
        // Customize other TextTheme properties as needed
        );
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
         textTheme:  _buildTextTheme(ThemeData.light().textTheme),
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LandingPage(),
    
    );
  }
}

