import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailScreen(this.product);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product['image'],
              height: size.height * 0.45,
              width: size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ...List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: Color(0xFFF2994A),
                          size: 16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          '8 reviews',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF605A65),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'In Stock',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Text(
              product['name'],
              style: TextStyle(
                color: Color(0xFF34283E),
                fontSize: 19,
              ),
            ),
            Text(
              product['price'],
              style: TextStyle(
                color: Color(0xFF34283E),
                fontSize: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
