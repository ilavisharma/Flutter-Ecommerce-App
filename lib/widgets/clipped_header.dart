import 'package:flutter/material.dart';

class ClippedHeader extends StatelessWidget {
  final String text;

  ClippedHeader(this.text);

  @override
  Widget build(BuildContext context) {
    final totalHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        ClipPath(
            clipper: _MyCustomClipper(),
            child: Container(
              height: totalHeight / 4,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF845FA1), Color(0xFF34283E)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(left: 25, top: 70),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
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
