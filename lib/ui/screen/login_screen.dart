import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:papikost/ui/constant/constant.dart';
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
  File? file;

  //attribute
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

  bool? statusNew = true;

  String? name;

  PageController _controller = PageController(initialPage: 0);

  //function

  @override
  initState() {
    super.initState();
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
            height: deviceHeight(context) * 0.1,
          ),
          statusNew! ? _textWelcomeNew() : _textWelcomeRememberMe(),
          statusNew! ? _textSecondRowNew() : _textSecondRowRememberMe(),
          SizedBox(
            height: 20,
          ),
          Expanded(child: pageBuilder()),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      child: Row(
        children: [
          Expanded(flex: 1, child: _tabBar()),
          Container(
            height: 15,
            width: 10,
            decoration: BoxDecoration(
              color: statusBarColor,
            ),
          ),
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
      onTap: () {},
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
              width: 10,
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
          fontSize: 20.0,
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
          fontSize: 20.0,
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

  Size _textSize(String text, TextStyle style) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  Widget _pageView(String page) {
    switch (page) {
      case 'Login':
        return Container(
          child: Column(
            children: [
              SizedBox(height: deviceWidth(context) * 0.1),
              _textField(
                  context: context,
                  hintText: 'Email',
                  textFocus: TextFocus.focus),
              SizedBox(height: 20),
              _textField(
                  context: context,
                  hintText: 'Password',
                  textFocus: TextFocus.unFocus),
              file != null ? Expanded(child: Image.file(file!)) : SizedBox(),
            ],
          ),
        );
      case 'SignUp':
        return Container(
          child: Column(
            children: [
              // _textField(TextFocus.focus, context, 'Email'),
              // _textField(TextFocus.unFocus, context, 'Password'),
              // file != null ? Expanded(child: Image.file(file!)) : SizedBox(),
            ],
          ),
        );
    }

    return Container();
  }

  Widget pageBuilder() {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: _controller,
      onPageChanged: (i) {
        index = i;
        setState(() {});
      },
      itemCount: listPage.length,
      itemBuilder: (context, i) {
        return _pageView(listPage[i]);
      },
    );
  }

  //textField widget
  dynamic focusScope(BuildContext context, TextFocus focus) {
    switch (focus) {
      case TextFocus.focus:
        return FocusScope.of(context).nextFocus();
      case TextFocus.unFocus:
        return FocusScope.of(context).unfocus();
      default:
    }
  }

  Widget _textField(
      {TextFocus textFocus = TextFocus.focus,
      BuildContext? context,
      String? hintText}) {
    return Container(
      height: deviceHeight(context!) * 0.1,
      child: TextField(
        onEditingComplete: () => focusScope(context, textFocus),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          hintText: hintText,
          hintMaxLines: 8,
        ),
      ),
    );
  }
}
