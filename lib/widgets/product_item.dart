import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ImageProvider<dynamic> image;
  final String price;
  final String name;
  final bool liked;

  const ProductItem({
    @required this.image,
    @required this.price,
    @required this.name,
    @required this.liked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            overflow: Overflow.visible,
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
              Positioned(
                right: 10,
                bottom: -18,
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(36),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: liked
                      ? Icon(
                          Icons.favorite,
                          size: 22,
                          color: Color(0xFFE7B944),
                        )
                      : ShaderMask(
                          shaderCallback: (bounds) {
                            final Rect rect = Rect.fromLTRB(0, 0, 22, 22);
                            return LinearGradient(
                              colors: [Color(0xFF845FA1), Color(0xFF34283E)],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              tileMode: TileMode.mirror,
                            ).createShader(rect);
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 22,
                            color: Colors.white,
                          )),
                ),
              )
            ],
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
