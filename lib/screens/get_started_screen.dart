import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;
    final totalWidth = MediaQuery.of(context).size.width;
    final borderRadius = 40.0;
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Image.asset(
              'assets/images/get_started_girl.png',
              fit: BoxFit.fitWidth,
              color: Color(0x732A034B),
              colorBlendMode: BlendMode.srcOver,
              height: totalHeight * 0.7,
              width: totalWidth,
            ),
          ],
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'SF-Pro',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text('Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'SF-Pro',
                      )),
                  color: Color(0xFFE7B944),
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: totalWidth * 0.25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
