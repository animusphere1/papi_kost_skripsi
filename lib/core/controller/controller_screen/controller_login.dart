import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControllerLogin extends ChangeNotifier {
  String _text = 'Send Email';
  String get text => _text;

  Future<void> sendEmail() async {
    await Future.delayed(Duration(seconds: 3));
    _text = 'sended waiting';

    print(_text);

    notifyListeners();

    await Future.delayed(Duration(seconds: 3));

    _text = 'send success';

    notifyListeners();
  }
}
