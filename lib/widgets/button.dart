import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;

  const Button({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'SF-Pro',
          )),
      color: Color(0xFFE7B944),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 80),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }
}
