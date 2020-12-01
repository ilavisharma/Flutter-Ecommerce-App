import 'package:ecommerce_app/data/catalogue.dart';
import 'package:ecommerce_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatelessWidget {
  static const routeName = '/catalogue';

  List<Widget> _buildCatalogue() {
    return Catalogue.map((item) {
      return Card(
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
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: Text(
          'Catalogue',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          iconSize: 28,
          color: Colors.white,
          onPressed: Navigator.of(context).pop,
        ),
        trailing: Container(width: 27),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 145,
            ),
            ..._buildCatalogue(),
          ],
        ),
      ),
    );
  }
}
