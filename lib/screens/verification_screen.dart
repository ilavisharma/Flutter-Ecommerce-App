import 'package:ecommerce_app/widgets/clipped_header.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  static const routeName = "/verification";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ClippedHeader('Verification\nCode')],
      ),
    );
  }
}
