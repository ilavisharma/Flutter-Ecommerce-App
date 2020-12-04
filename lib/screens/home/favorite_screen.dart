import 'package:ecommerce_app/data/products.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  List<Widget> _buildFavoriteProducts() {
    return FavoriteProducts.map((prod) {
      return ProductItem(
        image: AssetImage(prod['image']),
        price: prod['price'],
        name: prod['name'],
        liked: prod['liked'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '5 items',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort by:',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9b9b9b),
                      ),
                    ),
                    SizedBox(width: 10),
                    DropdownButton(
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF34283E),
                            fontFamily: 'SF-Pro'),
                        hint: Text('Sort by:'),
                        items: [
                          DropdownMenuItem(
                            child: Text('Price: lowest to high'),
                          )
                        ],
                        onChanged: (_) {}),
                  ],
                )
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            children: _buildFavoriteProducts(),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            childAspectRatio: 0.58,
          ),
        ],
      ),
    );
  }
}

class FavoriteTabAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(90);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 110,
            padding: EdgeInsets.only(left: 10, right: 10, top: 35, bottom: 15),
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
                IconButton(
                  icon: Icon(Icons.keyboard_backspace),
                  iconSize: 28,
                  color: Colors.white,
                  onPressed: Navigator.of(context).pop,
                ),
                Text(
                  'Favorite',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 27),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
