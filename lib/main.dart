import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/screens.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SF-Pro',
        primaryColor: Color(0xFF845FA1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GetStartedScreen(),
      routes: {
        EnterPhoneScreen.routeName: (ctx) => EnterPhoneScreen(),
        VerificationScreen.routeName: (ctx) => VerificationScreen(),
        HomeTabsScreen.routeName: (ctx) => HomeTabsScreen(),
      },
    );
  }
}
