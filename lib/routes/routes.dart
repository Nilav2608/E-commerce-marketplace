import "package:flutter/material.dart";
import 'package:fluxestore/Business_Logic/bloc/landing_page_bloc.dart';
import 'package:fluxestore/presentation/landing_page.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/presentation/pages/notification_page.dart';
import 'package:fluxestore/presentation/pages/product_details_page.dart';
import 'package:fluxestore/routes/custom_transition_routes.dart';

import '../models/productModel.dart';

class MyGenerateRoute {
  final LandingPageBloc landingPageBloc = LandingPageBloc();
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LandingPageBloc>.value(
            value: landingPageBloc,
            child: const LandingPage(),
          ),
        );

      case 'notifications':
        // return MaterialPageRoute(
        //   builder: (context) => const NotificationPage(),
        //   settings: settings
        // );
        return CustomPageTransition(
            child: const NotificationPage(), dx: 1.0, dy: 0.0);
      case 'productDetails':
        final ProducDatatModel productData =
            settings.arguments as ProducDatatModel;
        return CustomPageTransition(
            dx: 0.0, dy: 1.0, child:  ProductDetailsPage(data: productData,));
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
        body: const Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
