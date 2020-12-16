import 'package:judoo/widgets/navigationBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Judoo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: BottomNavigationBarController()
  ));
}
