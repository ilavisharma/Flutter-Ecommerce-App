import 'package:ecommerce_app/screens/home/catalogue_screen.dart';
import 'package:ecommerce_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class HomeTabsScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeTabsScreenState createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> {
  int _selectedTab = 0;

  final _tabs = [
    {'icon': Icons.home, 'name': 'Home', 'widget': HomeScreen()},
    {'icon': Icons.category, 'name': 'Catalogue', 'widget': CatalogueScreen()},
    {
      'icon': Icons.favorite,
      'name': 'Favorite',
      'widget': Center(child: Text('Favorite Screen'))
    },
    {
      'icon': Icons.account_circle,
      'name': 'Profile',
      'widget': Center(child: Text('Profile Screen'))
    },
  ];

  List<Widget> _buildTabIcons() {
    final size = 25.0;

    return _tabs.asMap().entries.map((tab) {
      return InkWell(
        onTap: () {
          setState(() {
            _selectedTab = tab.key;
          });
        },
        child: _selectedTab == tab.key
            ? ShaderMask(
                shaderCallback: (bounds) {
                  final Rect rect = Rect.fromLTRB(0, 0, size, size);
                  return LinearGradient(
                    colors: [Color(0xFF845FA1), Color(0xFF34283E)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    tileMode: TileMode.mirror,
                  ).createShader(rect);
                },
                child: _TabItem(
                  size: size,
                  color: Colors.white,
                  icon: tab.value['icon'],
                  name: tab.value['name'],
                ))
            : _TabItem(
                size: size,
                color: Color(0xFF9B9B9B),
                icon: tab.value['icon'],
                name: tab.value['name'],
              ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: SvgPicture.asset(
          'assets/icons/menu-alt.svg',
          height: 27,
          width: 27,
        ),
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 22.0),
            children: [
              TextSpan(
                text: 'My',
                style: TextStyle(
                  color: Color(0xFFE7B944),
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Montserrat',
                ),
              ),
              TextSpan(
                text: 'Shop',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
        ),
        trailing: SvgPicture.asset(
          'assets/icons/bell.svg',
          height: 27,
          width: 27,
        ),
      ),
      body: _tabs[_selectedTab]['widget'],
      bottomNavigationBar: Container(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [..._buildTabIcons(), Container(width: 30)],
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _CartTab(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CartTab extends StatelessWidget {
  const _CartTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(80),
            bottomLeft: Radius.circular(80),
          ),
          gradient: LinearGradient(
            colors: [Color(0xFF845FA1), Color(0xFF34283E)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            tileMode: TileMode.mirror,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '\$239.88',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '2 items',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    @required this.size,
    @required this.color,
    @required this.icon,
    @required this.name,
  });

  final double size;
  final Color color;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          icon,
          size: size,
          color: color,
        ),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
