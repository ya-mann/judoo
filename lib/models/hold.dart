import 'package:firebase_database/firebase_database.dart';

class Hold {
  String name, description, image;
  Hold({this.name, this.description, this.image});

  static Future<List<Hold>> getHolds() async {
    final techniques = await FirebaseDatabase.instance.reference().child("techniques").once();
    return (techniques.value as List<dynamic>).map((technique) {
      return Hold(
          name: technique['name'],
          description: technique['description'],
          image: technique['image']);
    }).toList();
  }
}
