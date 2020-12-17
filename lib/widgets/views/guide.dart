import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../navigationBar.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key key}) : super(key: key);
  static const name = 'Guide';
  static const icon = Icon(Icons.book, size: 26);

  final databaseReference = FirebaseDatabase.instance.reference();

  void getTechniques() async {
    final techniques = await databaseReference.child("techniques").once();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}