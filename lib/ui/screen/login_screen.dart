import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:papikost/core/controller/controller_screen/controller_login.dart';
import 'package:papikost/ui/constant/constant.dart';
import 'package:papikost/ui/enum/enum.dart';
import 'package:papikost/ui/router/router_generator.dart';
import 'package:papikost/ui/screen/widget/textfield.dart';
import 'package:papikost/ui/utils/property.dart';
import 'package:papikost/ui/utils/validator.dart';
import 'package:provider/provider.dart';

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

class _HomeBodyState extends State<HomeBody> with WidgetsBindingObserver {
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

  int indexTabBar = 0;

  List<String> tabBarTextList = [
    'Login',
    'Sign Up',
  ];

  bool? isStatusNew = true;
  String? name;
  String? pageActive;
  bool isRememberMe = false;

  //controller
  PageController _pageController = PageController(initialPage: 0);

  //function
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    pageActive = tabBarTextList[0];
    setState(() {});
  }

  @override
  dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);

    switch (state) {
      case AppLifecycleState.paused:
        print('lagi berhenti');
        break;
      case AppLifecycleState.inactive:
        print('lagi tutup bang');
        break;
      case AppLifecycleState.resumed:
        Navigator.pushNamed(context, RouterGenerator.routeHomeScreen);
        break;
      default:
    }
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
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Row(
        children: [
          Expanded(flex: 1, child: _tabBar()),
          Container(
            height: 15,
            width: 10,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
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
              status: indexTabBar == i,
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
      onTap: () {
        movePage(i!);
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
                hintText: Provider.of<ControllerLogin>(context).text.toString(),
                focus: TextFocus.focus,
              ),
              TextFieldItem(
                hintText: "Password",
                statusObscure: true,
                focus: TextFocus.unFocus,
                textType: TextType.password,
              ),
              _button(
                text: 'Login',
                onTap: () {},
              ),
              SizedBox(
                height: 20,
              ),
              _forgotPasswordAndSignUp(),
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
              ),
              TextFieldItem(
                hintText: 'Name',
              ),
              TextFieldItem(
                hintText: 'Address',
              ),
              TextFieldItem(
                hintText: 'Phone Number',
                textType: TextType.phoneNumber,
              ),
              TextFieldItem(
                hintText: 'Password',
                focus: TextFocus.unFocus,
                statusObscure: true,
                textType: TextType.password,
              ),
              SizedBox(
                height: 20,
              ),
              _button(
                text: 'Sign Up',
              ),
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
        controller: _pageController,
        onPageChanged: (i) {
          indexTabBar = i;
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

  //button widget
  Widget _button({Function? onTap, String text = 'Waiting'}) {
    return ElevatedButton(
      onPressed: () =>
          onTap != null ? onTap() : print('belom ada function button $text'),
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).buttonColor,
      ),
      child: Container(
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }

  Widget _forgotPasswordAndSignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _forgotPassword(),
      ],
    );
  }

  //forgot password text
  Widget _forgotPassword() {
    return GestureDetector(
      onTap: () => null,
      child: Container(
        child: Text(
          'Forgot Password?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  //function
  void movePage(int i) {
    pageActive = tabBarTextList[i];
    setState(() {});

    _pageController.jumpToPage(i);
  }

  void showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Consumer<ControllerLogin>(
          builder: (context, prov, _) {
            return Container(
              child: Center(
                child: GestureDetector(
                  onTap: () async {},
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: deviceWidth(context) * 0.5,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    await prov.sendEmail();
                                  },
                                  child: CircleAvatar(
                                    child: Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.yellow,
                          height: deviceHeight(context) * 0.4,
                          width: deviceWidth(context),
                          child: Text(prov.text),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
