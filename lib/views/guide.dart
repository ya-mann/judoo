import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:judoo/models/hold.dart';
import 'holdDetails.dart';

class GuidePage extends StatelessWidget {
  GuidePage({Key key}) : super(key: key);
  static const name = 'Guide';
  static const icon = Icon(Icons.book, size: 26);

  @override
  Widget build(BuildContext context) {
    final holds = Hold.getHolds();
    return Scaffold(
        body: FutureBuilder<List<Hold>>(
            future: holds,
            builder:
                (BuildContext context, AsyncSnapshot<List<Hold>> snapshot) {
              return SafeArea(
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      child: GridView.count(
                          primary: false,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          crossAxisCount: 3,
                          children: snapshot.hasData
                              ? snapshot.data.map((e) {
                                  return InkWell(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HoldDetails(data: e)));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Colors.white70),
                                        child: Center(
                                            child: Text(e.name,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4)),
                                      ));
                                }).toList()
                              : [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          color: Colors.white70),
                                      child: snapshot.hasError
                                          ? Icon(Icons.error_rounded,
                                              color: Colors.red)
                                          : Center(
                                              child: SizedBox(
                                                  child:
                                                      CircularProgressIndicator(),
                                                  height: 30,
                                                  width: 30)))
                                ])));
            }));
  }
}
