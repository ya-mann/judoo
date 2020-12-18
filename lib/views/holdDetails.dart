import 'package:flutter/material.dart';
import 'package:judoo/models/hold.dart';

class HoldDetails extends StatelessWidget {
  final Hold data;
  HoldDetails({this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
          child: Center(
              child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data.name,
              style: textTheme.headline1.copyWith(fontSize: 24),
              textAlign: TextAlign.center),
          SizedBox(height: 30),
          Text(data.description,
              style: textTheme.bodyText1.copyWith(fontSize: 18),
              textAlign: TextAlign.justify),
          SizedBox(height: 10),
          Image.network(data.image)
        ],
      ))),
    );
  }
}
