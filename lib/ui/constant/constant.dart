import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:supercharged/supercharged.dart';

List<String> listPage = ['Login', 'SignUp'];

final Color statusBarColor = '#eb3434'.toColor();

double deviceWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
