import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  List<Widget> _buildCartItems() {
    return _cartProducts.map((prod) {
      return _CartItem(
        image: prod['image'],
        title: prod['title'],
        price: prod['price'],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F3F4),
      appBar: GradientAppbar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          iconSize: 28,
          color: Colors.white,
          onPressed: Navigator.of(context).pop,
          padding: EdgeInsets.only(bottom: 2),
        ),
        title: 'Cart',
        trailing: Text('Delete',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            )),
      ),
      body: Column(
        children: _buildCartItems(),
      ),
      bottomSheet: Container(
        color: Color(0xFFF4F3F4),
        child: Container(
            height: 135,
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 5,
                  blurRadius: 30,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total price',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                    Text('\$239.98',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
                  ],
                ),
                Button(text: 'Check Out', onPressed: () {})
              ],
            )),
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  const _CartItem({this.image, this.title, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 6),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 3,
            child: Image.asset(
              image,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 10),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text('1', style: TextStyle(fontSize: 14)),
                ),
                Icon(
                  Icons.remove_circle_outline,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

const _cartProducts = [
  {
    'image': 'assets/images/item-2.jpg',
    'title': 'Astylish Women Open Front Long Sleeve Chunky Knit Cardigan',
    'price': '\$89.99',
  },
  {
    'image': 'assets/images/item-6.jpg',
    'title':
        'BORIFLORS Women\'s Sexy Wrap Front Long Sleeve Ruched Bodycon Mini Club Dress',
    'price': '\$149.99',
  }
];
