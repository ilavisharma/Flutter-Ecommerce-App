import 'package:ecommerce_app/data/products.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class FavoriteTab extends StatelessWidget {
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
            height: 80,
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
