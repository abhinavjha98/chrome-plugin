import 'package:flutter/material.dart';
import 'package:smsapp/components/constants.dart';
import 'package:smsapp/components/textFieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final Function onSubmit;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        style: TextStyle(color: Colors.black),
        cursorColor: kPrimaryColor,
        onSubmitted: onSubmit,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
