import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget leading;
  final Widget trailing;

  CustomAppBar({
    @required this.title,
    @required this.leading,
    @required this.trailing,
  });

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
                  leading,
                  title,
                  trailing,
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
          )
        ],
      ),
    );
  }
}
