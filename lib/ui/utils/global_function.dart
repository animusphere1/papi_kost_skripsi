//textField widget
import 'package:flutter/material.dart';
import 'package:papikost/ui/enum/enum.dart';

dynamic focusScope(BuildContext context, TextFocus focus) {
  switch (focus) {
    case TextFocus.focus:
      return FocusScope.of(context).nextFocus();
    case TextFocus.unFocus:
      return FocusScope.of(context).unfocus();
    default:
  }
}
