import 'package:flutter/material.dart';

class CustomPageTransition extends PageRouteBuilder {
  final Widget child;
  final double dx;
  final double dy;
  CustomPageTransition({
    required this.dx,
    required this.dy,
    required this.child,
  }) : super(
            transitionDuration: const Duration(milliseconds: 400),
            reverseTransitionDuration: const Duration(milliseconds: 400),
            pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    var  begin = Offset(dx, dy);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}


//Tween<Offset>(
      //   begin: const Offset(1, 0),
      //   end: Offset.zero,
        
      // ).animate(animation),