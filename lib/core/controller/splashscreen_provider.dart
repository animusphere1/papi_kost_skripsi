import 'package:flutter/cupertino.dart';
import 'package:papikost/ui/router/router_generator.dart';

class SplashScreenProvider extends ChangeNotifier {
  bool? _statusLogin = false;
  bool? get statusLogin => _statusLogin;

  checkAuth(BuildContext context) async {
    print(statusLogin);
    await changeStatus();

    switch (statusLogin) {
      case true:
        Navigator.pushReplacementNamed(
            context, RouterGenerator.routeHomeScreen);
        break;
      default:
    }

    print(statusLogin);
  }

  changeStatus() async {
    _statusLogin = true;

    await Future.delayed(Duration(seconds: 3));

    notifyListeners();
  }
}
