import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:papikost/ui/enum/enum.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  TextStyle textStyleStatusTrue = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
  );
  TextStyle textStyleStatusFalse = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Colors.grey.withOpacity(0.5),
  );

  int index = 0;

  List<String> tabBarTextList = [
    'Login',
    'Sign Up',
  ];

  bool? statusNew = false;

  String? name;

  @override
  initState() {
    super.initState();
    checkAuth();
  }

  checkAuth() {
    if (!statusNew!) {
      setState(() {
        name = 'Doni';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          statusNew! ? _textWelcomeNew() : _textWelcomeRememberMe(),
          statusNew! ? _textSecondRowNew() : _textSecondRowRememberMe(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      child: Row(
        children: [
          Expanded(flex: 1, child: _tabBar()),
          Icon(Icons.ac_unit),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return Container(
      child: Row(
        children: [
          for (var i = 0; i < tabBarTextList.length; i++)
            _tabBarText(
              status: index == i,
              text: tabBarTextList[i],
              i: i,
              textSize: _textSize(tabBarTextList[i], textStyleStatusTrue),
            ),
        ],
      ),
    );
  }

  Widget _tabBarText({
    bool? status,
    String? text,
    int? i,
    Size? textSize,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index = i!;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text!,
              style: status! ? textStyleStatusTrue : textStyleStatusFalse,
            ),
            SizedBox(
              height: 5,
            ),
            status
                ? Container(
                    height: 2,
                    width: textSize!.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _textWelcomeRememberMe() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black,
        ),
        children: [
          TextSpan(text: 'Welcome Back,'),
          WidgetSpan(
            child: SizedBox(
              width: 5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _textWelcomeNew() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black,
        ),
        children: [
          TextSpan(text: 'Hello,'),
          WidgetSpan(
            child: SizedBox(
              width: 5,
            ),
          ),
          TextSpan(
              text: 'Welcome',
              style: new TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _textSecondRowRememberMe() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.black,
        ),
        children: [
          WidgetSpan(
            child: SizedBox(
              width: 10,
            ),
          ),
          TextSpan(
            text: '${name!} !',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _textSecondRowNew() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.black,
        ),
        children: [
          WidgetSpan(
            child: SizedBox(
              width: 10,
            ),
          ),
          TextSpan(
            text: 'Choose Your New Home Now !',
          ),
        ],
      ),
    );
  }

  Widget _textField(TextFocus textFocus, BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      color: Colors.yellow,
    );
  }

  Size _textSize(String text, TextStyle style) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
