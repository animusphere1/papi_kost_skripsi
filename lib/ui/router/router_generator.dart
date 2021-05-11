import 'package:flutter/material.dart';
import 'package:papikost/ui/screen/home_screen.dart';
import 'package:papikost/ui/screen/login_screen.dart';
import 'package:papikost/ui/screen/splash_screen.dart';

class RouterGenerator {
  static const routeSplashScreen = "/";
  static const routeLoginPage = "/login";
  static const routeHomeScreen = "/restaurant/home";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    var returnRoute;

    print(settings.name);

    if (settings.name != null) {
      switch (settings.name) {
        case routeLoginPage:
          returnRoute = MaterialPageRoute(builder: (context) => LoginScreen());
          break;
        case routeHomeScreen:
          returnRoute = MaterialPageRoute(builder: (context) => HomeScreen());
          break;
        default:
          returnRoute = MaterialPageRoute(builder: (context) => SplashScreen());
          break;
      }
    }

    return returnRoute;
  }
}
