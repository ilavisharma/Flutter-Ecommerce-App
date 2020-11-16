import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class EnterPhoneScreen extends StatelessWidget {
  static const routeName = '/enter-phone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClippedHeader('What Is Your Phone\nNumber?'),
          Padding(
            padding: EdgeInsets.all(0),
            child: Text('Please enter your phone number to verify your account',
                style: TextStyle(
                  fontSize: 18,
                )),
          ),
          TextField(
            keyboardType: TextInputType.phone,
          ),
        ],
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final double _xScaling = size.width / 375;
    final double _yScaling = size.height / 197;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(0, 0, 375 * _xScaling, 0, 375 * _xScaling, 0);
    path.cubicTo(375 * _xScaling, 108.8 * _yScaling, 286.8 * _xScaling,
        197 * _yScaling, 178 * _xScaling, 197 * _yScaling);
    path.cubicTo(178 * _xScaling, 197 * _yScaling, 0, 197 * _yScaling, 0,
        197 * _yScaling);
    path.cubicTo(0, 197 * _yScaling, 0, 0, 0, 0);
    path.cubicTo(0, 0, 0, 0, 0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
