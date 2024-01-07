import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/landing_page.dart';
import 'package:fluxestore/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // debugShowPerformanceOverlay: true,
      theme: ThemeData(
        //  textTheme:  _buildTextTheme(ThemeData.light().textTheme),
        fontFamily: "ProductSans",
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context)=> const LandingPage()
      },
      onGenerateRoute: MyGenerateRoute().generateRoute,
    );
  }
}


