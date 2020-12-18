import 'package:flutter/material.dart';
import 'package:judoo/views/navigationBar.dart';

void main() {
  var black = Colors.black;

  runApp(MaterialApp(
      title: 'Judoo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: black),
          headline2: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: black),
          headline3: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: black),
          headline4: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: black),
          bodyText1: TextStyle(
              fontSize: 14, fontWeight: FontWeight.normal, color: black)
        ),
      ),
      home: BottomNavigationBarController()));
}
