import 'package:firebase_database/firebase_database.dart';

class Contact {
  String email, name, content, subject;
  Contact({this.email, this.name, this.content, this.subject});

  static Future<void> addContact(Contact contact) async {
    final database = FirebaseDatabase.instance.reference().child("contacts");
    database.push().set({
      'name': contact.name,
      'email': contact.email,
      'subject': contact.subject,
      'content': contact.content
    });
  }
}
