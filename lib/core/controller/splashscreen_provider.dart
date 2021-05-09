import 'package:flutter/cupertino.dart';
import 'package:papikost/ui/router/router_generator.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool? _statusLogin = true;
  bool? get statusLogin => _statusLogin;

  checkAuth(BuildContext context) async {
    switch (statusLogin) {
      case true:
        await Future.delayed(Duration(seconds: 2), () {
          Navigator.pushReplacementNamed(
              context, RouterGenerator.routeHomeScreen);
        });
        break;

      default:
    }
  }
}
