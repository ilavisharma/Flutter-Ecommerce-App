import 'package:flutter/material.dart';

class GradientIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const GradientIcon({this.icon, this.size});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        final Rect rect = Rect.fromLTRB(0, 0, size, size);
        return LinearGradient(
          colors: [Color(0xFF845FA1), Color(0xFF34283E)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          tileMode: TileMode.mirror,
        ).createShader(rect);
      },
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
    );
  }
}
