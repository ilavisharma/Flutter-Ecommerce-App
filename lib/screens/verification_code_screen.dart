import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  static const routeName = "/verification";

  List<Widget> _buildTextFields(BuildContext context) {
    return List(4).map((_) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: TextField(
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          onChanged: (_) => FocusScope.of(context).nextFocus(),
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            counterText: '',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green, width: 2),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClippedHeader('Verification\nCode'),
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Please enter code sent to ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '+380991234567',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Change Phone Number',
                        style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                Table(
                  children: [TableRow(children: _buildTextFields(context))],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Button(
                    text: 'Send Verification Code',
                    onPressed: () =>
                        Navigator.pushNamed(context, HomeTabsScreen.routeName),
                  ),
                ),
                FadedButton(
                  text: 'Resend Code',
                  onPressed: () =>
                      Navigator.pushNamed(context, HomeTabsScreen.routeName),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
