import 'package:ecommerce_app/data/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  List<Widget> _buildCategories() {
    return List.generate(
      Categories.length,
      (i) => Container(
        margin: i != Categories.length - 1
            ? EdgeInsets.only(right: 20)
            : EdgeInsets.zero,
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
            image: AssetImage(Categories[i]['image']),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color(0x7334283E),
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            Categories[i]['title'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 160,
              ),
              Carousal(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Catalogue',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9B9B9B),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildCategories(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}