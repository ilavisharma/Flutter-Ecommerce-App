import 'package:flutter/material.dart';

class Carousal extends StatelessWidget {
  List<Widget> _buildIndicators(BuildContext context) {
    return List(4).map((_) {
      return Container(
        width: 65,
        height: 2.5,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
            image: AssetImage('assets/images/carousal_bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromRGBO(29, 35, 50, 0.6),
              BlendMode.srcOver,
            )),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fashion Sale',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'See More',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFE7B944),
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildIndicators(context),
            ),
          ],
        ),
      ),
    );
  }
}
