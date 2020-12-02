import 'package:ecommerce_app/data/catalogue.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  static const routeName = '/catalogue';

  static const _categories = [
    'Clothing',
    'Shoes',
    'Jewelry',
    'Watches',
    'Handbags',
    'Accessories',
    'Men\'s Fashion',
    'Girls\' Fashion',
    'Boys\' Fashion'
  ];

  void _handleItemClick(BuildContext context, String title) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ),
                    ..._categories
                        .map(
                          (cat) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(cat, style: TextStyle(fontSize: 15)),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  List<Widget> _buildCatalogue(BuildContext context) {
    return Catalogue.map((item) {
      return InkWell(
        onTap: () => _handleItemClick(context, item['title']),
        child: Card(
          shadowColor: Colors.black,
          elevation: 2.5,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                  item['title'],
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image.asset(
                item['image'],
                height: 95,
                width: 95,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 145,
          ),
          ..._buildCatalogue(context),
        ],
      ),
    );
  }
}
