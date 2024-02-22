import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/landing_page/landing_page.dart';
import 'package:fluxestore/routes/routes.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    MyApp(
      token: prefs.getString("token")
      )
    );
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, required this.token});

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
      
      initialRoute: (token != null && JwtDecoder.isExpired(token.toString()) == false) ? '/' : 'Authentication',
      routes: {'/': (context) => LandingPage(token: token??'')},
      onGenerateRoute: MyGenerateRoute().generateRoute,
    );
  }
}
