import 'package:flutter/material.dart';

class GradientAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final String title;
  final Widget trailing;

  const GradientAppbar({
    @required this.leading,
    @required this.title,
    this.trailing,
  });

  @override
  Size get preferredSize => Size.fromHeight(70);

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 100,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: MediaQuery.of(context).padding.top + 13,
              bottom: 15,
            ),
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
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing ?? SizedBox(width: 27),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
