import "package:flutter/material.dart";

// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxestore/models/banners_data_model.dart';
import 'package:fluxestore/models/my_orders_data_model.dart';
import 'package:fluxestore/presentation/landing_page.dart';
import 'package:fluxestore/presentation/pages/order_details_page.dart';
import 'package:fluxestore/presentation/pages/checkout/checkout_main.view.dart';
import 'package:fluxestore/presentation/pages/collections_page.dart';
import 'package:fluxestore/presentation/pages/notification_page.dart';
import 'package:fluxestore/presentation/pages/product_details_page.dart';
import 'package:fluxestore/presentation/pages/product_feedback.dart';
import 'package:fluxestore/presentation/pages/settings_page.dart';
import 'package:fluxestore/presentation/pages/wish_list_page.dart';
import 'package:fluxestore/routes/custom_transition_routes.dart';
import '../Business_Logic/CheckOutPageBloc/check_out_page_bloc.dart';
import '../Business_Logic/landing_page_bloc/landing_page_bloc.dart';
import '../models/product_data_model.dart';
import '../presentation/pages/MyOrders/my_orders.dart';

class MyGenerateRoute {
  final LandingPageBloc landingPageBloc = LandingPageBloc();
  final CheckOutPageBloc checkOutPageBloc = CheckOutPageBloc();
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
        return CustomPageTransition(
            child: const NotificationPage(),
            dx: 1.0,
            dy: 0.0,
            curves: Curves.easeInOutCirc);
      case 'viewCollections':
        final BannersDataModel data = settings.arguments as BannersDataModel;
        return CustomPageTransition(
            dx: 0.0,
            dy: 1.0,
            curves: Curves.easeInOutCirc,
            child: CollectionsPage(
              bannerData: data,
            ));
      case 'productDetails':
        final ProductDataModel productData =
            settings.arguments as ProductDataModel;
        return CustomPageTransition(
          //for bottom up transition
            dx: 0.0,
            dy: 1.0,
            curves: Curves.easeInOutCirc,
            child: ProductDetailsPage(
              data: productData,
            ));
      case 'MyOrders':
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: const MyOrdersPage());
      case 'settings':
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: const SettingsPage());
      // case 'checkOut':
      //   final MyOrdersDataModel myordersData =
      //       settings.arguments as MyOrdersDataModel;
      //   return MaterialPageRoute(
      //     builder: (_) => CheckOutPage(
      //       myOrdersData: myordersData,
      //     ),
      //   );
      case "checkOut":
        final MyOrdersDataModel myordersData =
            settings.arguments as MyOrdersDataModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<CheckOutPageBloc>.value(
            value: checkOutPageBloc,
            child: CheckOutPage(
              myOrdersData: myordersData,
            ),
          ),
        );
      case 'orderDetailsPage':
        final MyOrdersDataModel myordersData =
            settings.arguments as MyOrdersDataModel;
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: OrderDetailsPage(
              data: myordersData,
            ));
      case 'WishListPage':
        return CustomPageTransition(
            curves: Curves.easeInOutCirc,
            dx: 1.0,
            dy: 0.0,
            child: const WishListPage());
       case 'productFeedbackPage':
        return CustomPageTransition(
          //for bottom up transition
            dx: 0.0,
            dy: 1.0,
            curves: Curves.easeInOutCirc,
            child: const ProductFeedBackPage());
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

// return PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) =>
//               const MyOrdersPage(),
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return FadeTransition(
//               opacity: animation,
//               child: child,
//             );
//           },
//         );