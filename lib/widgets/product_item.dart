import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final String price;
  final String name;

  const ProductItem({
    @required this.image,
    @required this.price,
    @required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 145,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: Color(0xFFF2994A),
                  size: 16,
                ),
              ),
            ),
          ),
          Container(
            width: 140,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 15.5),
            ),
          ),
          Text(
            price,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
