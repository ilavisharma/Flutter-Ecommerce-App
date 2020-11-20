import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: SvgPicture.asset(
          'assets/icons/menu-alt.svg',
          height: 27,
          width: 27,
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 22.0),
            children: [
              TextSpan(
                text: 'My',
                style: TextStyle(
                    color: Color(0xFFE7B944),
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat'),
              ),
              TextSpan(
                text: 'Shop',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat'),
              ),
            ],
          ),
        ),
        trailing: SvgPicture.asset(
          'assets/icons/bell.svg',
          height: 27,
          width: 27,
        ),
      ),
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}
