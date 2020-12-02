import 'package:flutter/material.dart';
import 'package:ecommerce_app/data/catalogue.dart';
import 'package:ecommerce_app/data/products.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
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
        name: product['name'])).toList();
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
