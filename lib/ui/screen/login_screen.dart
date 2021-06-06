import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:papikost/ui/constant/constant.dart';
import 'package:papikost/ui/enum/enum.dart';
import 'package:papikost/ui/router/router_generator.dart';
import 'package:papikost/ui/screen/widget/textfield.dart';
import 'package:papikost/ui/utils/global_function.dart';
import 'package:papikost/ui/utils/property.dart';
import 'package:papikost/ui/utils/validator.dart';

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

  //controller
  PageController _controller = PageController(initialPage: 0);

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
          pageActive == "Login"
              ? Container(
                  height: deviceHeight(context) * 0.1, child: _textLogin())
              : Container(
                  height: deviceHeight(context) * 0.1, child: _textSignUp()),
          Expanded(child: _pageBuilder()),
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
              textSize: underLineTextSize(listPage[i], textStyleStatusTrue),
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

  //pageview textfield login and signup
  Widget _pageView(String page) {
    switch (page) {
      case 'Login':
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFieldItem(
                hintText: 'Email',
                focus: TextFocus.focus,
              ),
              TextFieldItem(
                icon: Icons.remove_red_eye,
                hintText: "Password",
                statusObscure: true,
                focus: TextFocus.unFocus,
                onChange: (value) => null,
              ),
              _button(() => null, text: 'Login'),
              Expanded(child: Container()),
              _forgotPassword(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      case 'SignUp':
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              TextFieldItem(
                hintText: 'Email',
                focus: TextFocus.focus,
              ),
              TextFieldItem(
                hintText: 'Username',
                focus: TextFocus.focus,
              ),
              TextFieldItem(
                hintText: 'Name',
                focus: TextFocus.focus,
              ),
              TextFieldItem(
                hintText: 'Address',
                focus: TextFocus.focus,
              ),
              TextFieldItem(
                hintText: 'Password',
                icon: Icons.remove_red_eye,
                focus: TextFocus.unFocus,
              ),
              SizedBox(
                height: 20,
              ),
              _button(() => print(index), text: 'Sign Up'),
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

  //textfield widget

  //button widget
  Widget _button(Function? function, {String text = 'Waiting'}) {
    return ElevatedButton(
      onPressed: () => function != null
          ? function()
          : print('belom ada function button $text'),
      child: Container(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }

  //forgot password text
  Widget _forgotPassword() {
    return Container(
      child: Text(
        'Forget Password ?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class StatusObscure extends StatefulWidget {
  Function(bool)? func;

  StatusObscure({this.func});

  @override
  _StatusObscureState createState() => _StatusObscureState();
}

class _StatusObscureState extends State<StatusObscure> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
