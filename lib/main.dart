import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papikost/core/controller/controller_screen/controller_login.dart';
import 'package:papikost/core/controller/location_provider.dart';
import 'package:papikost/core/controller/splashscreen_provider.dart';
import 'package:papikost/core/controller/theme_provider.dart';
import 'package:papikost/ui/constant/constant.dart';
import 'package:papikost/ui/router/router_generator.dart';
import 'package:provider/provider.dart';

main(List<String> args) {
  runApp(MyApp());
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
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ControllerLogin()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, prov, _) {
          return MaterialApp(
            onGenerateRoute: RouterGenerator.generateRoute,
            initialRoute: RouterGenerator.routeLoginPage,
            theme: prov.themeData,
          );
        },
      ),
    );
  }
}
