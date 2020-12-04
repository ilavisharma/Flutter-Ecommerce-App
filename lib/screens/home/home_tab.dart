import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/data/catalogue.dart';
import 'package:ecommerce_app/data/products.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class HomeTab extends StatelessWidget {
  List<Widget> _buildCatalogue() {
    return List.generate(
      Catalogue.length,
      (i) => Container(
        margin: i != Catalogue.length - 1
            ? EdgeInsets.only(right: 20)
            : EdgeInsets.zero,
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
            image: AssetImage(Catalogue[i]['image']),
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
            Catalogue[i]['title'],
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

  List<Widget> _buildFeaturedProducts() {
    return FeaturedProducts.map((product) => ProductItem(
          image: AssetImage(product['image']),
          price: product['price'],
          name: product['name'],
          liked: product['liked'],
        )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
          ),
          Carousal(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
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
                FlatButton(
                    child: Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9B9B9B),
                      ),
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _buildCatalogue(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Featured',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.count(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            crossAxisCount: 2,
            children: _buildFeaturedProducts(),
            childAspectRatio: 0.58,
            physics: NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}

class HomeTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(120);

  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(Radius.circular(40)),
    );
    return Container(
      child: Column(
        children: [
          Align(
            heightFactor: 0.8,
            alignment: Alignment.topCenter,
            child: Container(
              height: 110,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF845FA1), Color(0xFF34283E)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/menu-alt.svg',
                    height: 27,
                    width: 27,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 22.0),
                      children: [
                        TextSpan(
                          text: 'My',
                          style: TextStyle(
                            color: Color(0xFFE7B944),
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        TextSpan(
                          text: 'Shop',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/bell.svg',
                    height: 27,
                    width: 27,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 46,
            margin: EdgeInsets.symmetric(horizontal: 23),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 10,
                  blurRadius: 30,
                ),
              ],
            ),
            child: TextField(
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "What are you looking for?",
                prefixIcon: Icon(Icons.search),
                border: border,
                enabledBorder: border,
                focusedBorder: border,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
