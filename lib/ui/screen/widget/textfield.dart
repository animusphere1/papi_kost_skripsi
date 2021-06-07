import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:papikost/ui/enum/enum.dart';
import 'package:papikost/ui/utils/global_function.dart';
import 'package:papikost/ui/utils/validator.dart';

// ignore: must_be_immutable
class TextFieldItem extends StatefulWidget {
  String? hintText;
  bool statusObscure;
  bool readOnly;
  TextInputType inputType;
  TextType textType;
  Function(String)? onChange;
  TextFocus focus;

  TextFieldItem({
    @required this.hintText,
    this.statusObscure = false,
    this.readOnly = false,
    this.inputType = TextInputType.text,
    this.textType = TextType.phoneNumber,
    this.onChange,
    this.focus = TextFocus.focus,
  });

  @override
  _TextFieldItemState createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> with Validator {
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
                keyboardType: widget.inputType,
                inputFormatters: [
                  textTypeReturn(widget.textType),
                ],
                onChanged: (value) {
                  widget.onChange != null
                      ? widget.onChange!(value)
                      : print('belum ada function ${widget.hintText}');
                },
                onEditingComplete: () => focusScope(context, widget.focus),
                obscureText: widget.statusObscure,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
            isPasswordHaveObscure(widget.statusObscure),
          ],
        ),
      ),
    );
  }

  void changeObscureText() {
    widget.statusObscure = !widget.statusObscure;

    setState(() {});
  }

  Widget isPasswordHaveObscure(bool isStatusObscure) {
    if (widget.textType == TextType.password) {
      if (isStatusObscure) {
        return GestureDetector(
          onTap: () {
            changeObscureText();
          },
          child: Icon(
            Icons.remove_red_eye,
            color: Colors.black38.withOpacity(0.5),
          ),
        );
      } else if (!isStatusObscure) {
        return GestureDetector(
          onTap: () {
            changeObscureText();
          },
          child: Icon(
            Icons.visibility_off,
            color: Colors.black38.withOpacity(0.5),
          ),
        );
      }
    }

    return SizedBox();
  }
}
