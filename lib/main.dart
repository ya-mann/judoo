import 'package:judoo/widgets/navigationBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Judoo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
          headline3: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          headline4: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      home: BottomNavigationBarController()));
}
