import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget leading;
  final Widget trailing;

  CustomAppBar(
      {@required this.title, @required this.leading, @required this.trailing});

  @override
  Size get preferredSize => Size.fromHeight(75);

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.top + 75,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF845FA1), Color(0xFF34283E)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      padding: EdgeInsets.only(
          left: 15, right: 15, top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          title,
          trailing,
        ],
      ),
    );
  }
}
