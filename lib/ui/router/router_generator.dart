import 'package:flutter/material.dart';
import 'package:papikost/ui/screen/home_screen.dart';
import 'package:papikost/ui/screen/splash_screen.dart';

class RouterGenerator {
  static const routeSplashScreen = "/";
  static const routeHomeScreen = "/restaurant/home";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    print(settings.name);

    if (settings.name != null) {
      switch (settings.name) {
        case routeHomeScreen:
          return MaterialPageRoute(builder: (context) => HomeScreen());
        default:
          return MaterialPageRoute(builder: (context) => SplashScreen());
      }
    }
  }
}
