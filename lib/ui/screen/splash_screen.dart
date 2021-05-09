import 'package:flutter/material.dart';
import 'package:papikost/core/controller/splashscreen_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Provider.of<SplashScreenProvider>(context, listen: false)
        .checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('ini Splash Screen'),
        ),
      ),
    );
  }
}
