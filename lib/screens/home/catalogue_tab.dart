import 'package:flutter/material.dart';
import 'package:ecommerce_app/data/catalogue.dart';

const _categories = [
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

class CatalogueTab extends StatelessWidget {
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

class CatalogueTabAppBar extends StatelessWidget
    implements PreferredSizeWidget {
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
                  IconButton(
                    icon: Icon(Icons.keyboard_backspace),
                    iconSize: 28,
                    color: Colors.white,
                    onPressed: Navigator.of(context).pop,
                  ),
                  Text(
                    'Catalogue',
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
