import 'package:flutter/material.dart';

class FadedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const FadedButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FlatButton(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF9B9B9B),
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
