import 'package:ecommerce_app/screens/screens.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;
    final totalWidth = MediaQuery.of(context).size.width;
    const borderRadius = 40.0;

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/get_started_girl.png',
              fit: BoxFit.fitHeight,
              color: Color(0x732A034B),
              colorBlendMode: BlendMode.srcOver,
              height: totalHeight * 0.7,
              width: totalWidth,
            ),
          ],
        ),
        Positioned(
          top: totalHeight * 0.55,
          left: totalWidth / 3,
          child: ClipPath(
            clipper: _MyCustomClipper(),
            child: Container(
              height: totalHeight * 0.20,
              width: totalWidth - totalWidth / 3,
              color: Color(0xB3E7B944),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF845FA1), Color(0xFF34283E)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                )),
            height: totalHeight * 0.35,
            width: totalWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: 'My',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Color(0xFFE7B944),
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Montserrat'),
                    ),
                    TextSpan(
                      text: 'Shop',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Montserrat'),
                    ),
                  ])),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Button(
                    text: "Get Started",
                    onPressed: () {
                      Navigator.pushNamed(context, EnterPhoneScreen.routeName);
                    },
                  ),
                  SizedBox(height: 13)
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(
        0, size.height * 0.45, size.width * 0.24, 0, size.width * 0.54, 0);
    path.cubicTo(size.width * 0.54, 0, size.width, 0, size.width, 0);
    path.cubicTo(
        size.width, 0, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, size.width, size.height, size.width,
        size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
