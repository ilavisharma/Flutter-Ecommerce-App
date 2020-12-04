import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  List<Widget> _buildOptions() {
    return _Settings.map((opt) {
      return Card(
          shadowColor: Colors.black,
          elevation: 2.5,
          margin: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientIcon(icon: opt['icon'], size: 25),
                  Text(
                    opt['name'],
                    style: TextStyle(
                      color: Color(0xFF605A65),
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(width: 65),
                ]),
          ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            SizedBox(height: 155),
            ..._buildOptions(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Privacy Policy',
              style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
                color: Color(0xFF605A65),
              )),
        )
      ],
    );
  }
}

class ProfileTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(140);

  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
            clipper: _MyCustomClipper(),
            child: Container(
              height: preferredSize.height,
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
          padding: EdgeInsets.only(left: 25, top: 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image.asset(
                  'assets/images/profile_image.jpg',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    Text(
                      'Oleh Chabanov',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '+38 (099) 123 45 67',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 42,
                height: 42,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: GradientIcon(
                  icon: Icons.edit,
                  size: 28,
                ),
              ),
            ],
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

const _Settings = [
  {
    'icon': Icons.location_on,
    'name': 'Shipping Addresses',
  },
  {
    'icon': Icons.payment,
    'name': 'Payment Methods',
  },
  {
    'icon': Icons.location_on,
    'name': 'Orders',
  },
  {
    'icon': Icons.shopping_cart,
    'name': 'Favorite',
  },
  {
    'icon': Icons.settings,
    'name': 'Settings',
  },
  {
    'icon': Icons.exit_to_app,
    'name': 'Log Out',
  },
];
