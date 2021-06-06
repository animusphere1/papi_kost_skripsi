import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papikost/ui/enum/enum.dart';

// ignore: must_be_immutable
class TextFieldItem extends StatefulWidget {
  IconData? icon;
  String? hintText;
  bool statusObscure;
  bool readOnly;
  TextInputType inputType;
  TextType textType;
  Function(String)? onChange;
  TextFocus focus;

  TextFieldItem({
    this.icon,
    @required this.hintText,
    this.statusObscure = false,
    this.readOnly = false,
    this.inputType = TextInputType.text,
    this.textType = TextType.phoneNumber,
    this.onChange,
    this.focus = TextFocus.unFocus,
  });

  @override
  _TextFieldItemState createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  TextEditingController _textEditingController =
      TextEditingController(text: '');

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black38.withOpacity(0.05)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _textEditingController,
                keyboardType: widget.inputType,
                inputFormatters: [
                  textType(),
                ],
                onChanged: (value) {
                  widget.onChange != null
                      ? widget.onChange!(value)
                      : print('belum ada function ${widget.hintText}');
                },
                onEditingComplete: () => focusScope(context),
                obscureText: widget.statusObscure,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
              ),
            ),

            //icon show hide
            widget.icon != null
                ? GestureDetector(
                    onTap: () {
                      changeObscureText();
                    },
                    child: Icon(
                      widget.icon,
                      color: Colors.black38.withOpacity(0.5),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }

  void changeObscureText() {
    widget.statusObscure = !widget.statusObscure;

    if (widget.statusObscure)
      widget.icon = Icons.remove_red_eye;
    else
      widget.icon = Icons.visibility_off;

    setState(() {});
  }

  FilteringTextInputFormatter textType() {
    switch (widget.textType) {
      case TextType.phoneNumber:
        return FilteringTextInputFormatter.deny(RegExp(r'^0+'),
            replacementString: '');
      default:
        return FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]"),
            replacementString: '');
    }
  }

  dynamic focusScope(BuildContext context) {
    switch (widget.focus) {
      case TextFocus.focus:
        return FocusScope.of(context).nextFocus();
      case TextFocus.unFocus:
        return FocusScope.of(context).unfocus();
    }
  }
}
