import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Technique {
  String name, description, image;
  Technique({this.name, this.description, this.image});
}

class TechniqueView extends StatelessWidget {
  Technique data;
  TechniqueView({this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(this.data.name,
              style:
                  Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),
              textAlign: TextAlign.center),
          SizedBox(height: 30),
          Text(this.data.description,
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18),
              textAlign: TextAlign.justify),
          SizedBox(height: 10),
          Image.network(this.data.image)
        ],
      ))),
    );
  }
}

class GuidePage extends StatelessWidget {
  GuidePage({Key key}) : super(key: key);
  static const name = 'Guide';
  static const icon = Icon(Icons.book, size: 26);

  final databaseReference = FirebaseDatabase.instance.reference();

  Future<List<Technique>> getTechniques() async {
    final techniques = await databaseReference.child("techniques").once();
    return (techniques.value as List<dynamic>).map((technique) {
      return Technique(
          name: technique['name'],
          description: technique['description'],
          image: technique['image']);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final techniques = getTechniques();
    return Scaffold(
        body: FutureBuilder<List<Technique>>(
            future: techniques,
            builder: (BuildContext context,
                AsyncSnapshot<List<Technique>> snapshot) {
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
                                                    TechniqueView(data: e)));
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
