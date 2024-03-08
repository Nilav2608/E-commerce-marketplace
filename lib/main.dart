import 'package:flutter/material.dart';
import 'package:fluxestore/presentation/landing_page/landing_page.dart';
import 'package:fluxestore/routes/routes.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await dotenv.load(fileName: '.env');
  runApp(MyApp(
    token: prefs.getString("token"),
    initScreen: initScreen,
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  final int? initScreen;
  const MyApp({super.key, required this.token, required this.initScreen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "ProductSans",
        useMaterial3: true,
      ),
      initialRoute:
          (token != null && JwtDecoder.isExpired(token.toString()) == false)
              ? '/'
              : (initScreen == 0 || initScreen == null)
                  ? "onBording"
                  : 'Authentication',
      routes: {'/': (context) => LandingPage(token: token ?? '')},
      onGenerateRoute: MyGenerateRoute().generateRoute,
    );
  }
}
