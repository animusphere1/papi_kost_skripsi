import 'package:flutter/services.dart';
import 'package:papikost/ui/enum/enum.dart';

mixin Validator {
  FilteringTextInputFormatter textTypeReturn(TextType textType) {
    switch (textType) {
      case TextType.phoneNumber:
        return FilteringTextInputFormatter.deny(RegExp(r'^0+'),
            replacementString: '');
      default:
        return FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]"),
            replacementString: '');
    }
  }
}
