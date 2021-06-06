import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papikost/core/controller/location_provider.dart';
import 'package:papikost/core/controller/splashscreen_provider.dart';
import 'package:papikost/ui/constant/constant.dart';
import 'package:papikost/ui/router/router_generator.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: statusBarColor,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SplashScreenProvider()),
        ChangeNotifierProvider(create: (context) => LocationProv()),
      ],
      child: MaterialApp(
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: RouterGenerator.routeLoginPage,
      ),
    );
  }
}
