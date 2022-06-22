import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mini_project/screens/detail_product_screen.dart';
import 'package:flutter_mini_project/screens/home_screen.dart';
import 'package:flutter_mini_project/screens/splash_screen.dart';

class RouteGeneratorSettings {
  static const String urlApi = "https://fakestoreapi.com";

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String? routeName = settings.name;

    switch (routeName) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case "/home":
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) =>
              FadeTransition(
                  opacity: animation.drive(Tween<double>(begin: 0.0, end: 1.0)),
                  child: const HomeScreen()),
        );
      case "/detail_product":
        return PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (context, animation, secondaryAnimation) =>
              SlideTransition(
            position: animation.drive(Tween<Offset>(
                begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))),
            child: DetailProductScreen(idProduct: settings.arguments as int),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
    }
  }
}
