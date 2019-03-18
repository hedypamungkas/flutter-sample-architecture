import 'package:flutter/material.dart';
import 'flow/homepage/homepage_screen.dart';

class AppCoordinator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loan Mobile SDK',
      theme: ThemeData(fontFamily: 'Barlow'),
      home: HomepageScreen()
    );
  }
}