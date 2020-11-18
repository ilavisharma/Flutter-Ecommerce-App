import 'package:ecommerce_app/screens/verification_screen.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EnterPhoneScreen extends StatelessWidget {
  static const routeName = '/enter-phone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Hide soft keyboard when clicked outside
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: Column(
          children: [
            ClippedHeader('What Is Your Phone\nNumber?'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      'Please enter your phone number to verify your account',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w200),
                    ),
                  ),
                  TextField(
                    maxLength: 10,
                    textAlign: TextAlign.center,
                    showCursor: false,
                    style: TextStyle(
                      fontSize: 19,
                    ),
                    decoration: InputDecoration(
                      hintText: '(99) 999 99 99',
                      counterText: '',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                      hintStyle: TextStyle(fontSize: 19, letterSpacing: 1.1),
                      prefixText: '+91',
                      prefixIcon: Icon(Icons.flag),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 10),
                    child: Button(
                      text: 'Send Verification Code',
                      onPressed: () => Navigator.pushNamed(
                          context, VerificationScreen.routeName),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      child: Text(
                        'Skip',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF9B9B9B),
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      onPressed: () => Navigator.pushNamed(
                          context, VerificationScreen.routeName),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
