import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:papikost/ui/constant/constant.dart';
import 'package:papikost/ui/enum/enum.dart';
import 'package:papikost/ui/router/router_generator.dart';
import 'package:papikost/ui/utils/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> with Validator {
  //property

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

  bool? isStatusNew = true;

  String? name;

  String? pageActive;

  String? coba;

  //controller
  PageController _controller = PageController(initialPage: 0);
  TextEditingController _textEditingController = TextEditingController();
  //function

  @override
  initState() {
    super.initState();
    pageActive = tabBarTextList[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(),
          pageActive == "Login" ? _textLogin() : _textSignUp(),
          Expanded(flex: 2, child: _pageBuilder()),
        ],
      ),
    );
  }

  //appbar
  Widget _appBar() {
    return Container(
      // height: deviceHeight(context) * 0.2,
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
          for (var i = 0; i < listPage.length; i++)
            _tabBarText(
              status: index == i,
              text: listPage[i],
              i: i,
              textSize: _textSize(listPage[i], textStyleStatusTrue),
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
      onTap: () async {
        pageActive = tabBarTextList[i!];
        setState(() {});

        //change pageview show
        _controller.jumpToPage(i);
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

  //title Login
  Widget _textLogin() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isStatusNew! ? _textWelcomeNew() : _textWelcomeRememberMe(),
          isStatusNew! ? _textSecondRowNew() : _textSecondRowRememberMe(),
        ],
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

  Widget _textSignUpWelcome() {
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
              text: 'Beautifull',
              style: new TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _textSignUpWelcomeSecondRow() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
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
            text: 'Enter your information below or Login With Social Account',
          ),
        ],
      ),
    );
  }

  //title sign up
  Widget _textSignUp() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _textSignUpWelcome(),
          _textSignUpWelcomeSecondRow(),
        ],
      ),
    );
  }

  //property title
  Size _textSize(String text, TextStyle style) {
    TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  //pageview textfield login and signup
  Widget _pageView(String page) {
    switch (page) {
      case 'Login':
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _textField(
                context: context,
                hintText: 'Email',
                textFocus: TextFocus.focus,
              ),
              _textField(
                context: context,
                hintText: 'Password',
                textFocus: TextFocus.unFocus,
              ),
            ],
          ),
        );
      case 'SignUp':
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              _textField(
                context: context,
                hintText: 'Fullname',
                textFocus: TextFocus.focus,
              ),
              _textField(
                context: context,
                hintText: 'Phone Number',
                textFocus: TextFocus.focus,
                textInputType: TextInputType.phone,
                textType: TextType.phoneNumber,
              ),
              _textField(
                context: context,
                hintText: 'Email Address',
                textFocus: TextFocus.focus,
              ),
              _textField(
                context: context,
                hintText: 'Password',
                textFocus: TextFocus.unFocus,
              ),
              _button(),
            ],
          ),
        );
    }

    return Container();
  }

  Widget _pageBuilder() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: _controller,
        onPageChanged: (i) {
          index = i;
          pageActive = listPage[i];

          setState(() {});
        },
        itemCount: listPage.length,
        itemBuilder: (context, i) {
          return _pageView(listPage[i]);
        },
      ),
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

  //textfield widget
  Widget _textField(
      {TextFocus textFocus = TextFocus.focus,
      BuildContext? context,
      String? hintText,
      TextInputType textInputType = TextInputType.text,
      TextType textType = TextType.text,
      Function? onChange}) {
    return Container(
      height: deviceHeight(context!) * 0.1,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.all(10),
        child: TextField(
          controller: _textEditingController,
          // readOnly: true,
          onTap: () {},
          onChanged: (value) async {
            onChange != null
                ? onChange()
                : print('belum ada parametes $hintText');
          },
          inputFormatters: [
            textTypeReturn(textType),
          ],
          onEditingComplete: () => focusScope(context, textFocus),
          keyboardType: textInputType,
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }

  Widget _button() {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, RouterGenerator.routeHomeScreen),
      child: Container(
        height: deviceHeight(context) * 0.1,
        width: deviceWidth(context) * 0.2,
        decoration: BoxDecoration(
          color: buttonLoginColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
