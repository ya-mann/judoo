import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:judoo/components/contactForm.dart';
import 'package:judoo/models/contact.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final databaseReference = FirebaseDatabase.instance.reference();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          shrinkWrap: true,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40, bottom: 15),
              child: Text('A propos',
                  style: textTheme.headline2.copyWith(fontSize: 22),
                  textAlign: TextAlign.left),
            ),
            Text(
                'Looorem iiiiipsum doolor sit amet, edipisciddng elit. Veerrestibulum vitae lorem interdum, placerat augue ac, viverra eros. Sed imperdiet enim non magna maximus lacinia. Nulla ac lacus non ante pulvinar posuere quis et leo. Nullam accumsan lacus in elementum lobortis. Nulla dignissim quis sem eu tempus. Vestibulum dignissim, ligula quis hendrerit tempus, mi nisi feugiat nisi, iaculis malesuada dui turpis vitae felis. Aenean vehicula, lorem ornare volutpat consectetur, lectus nisi pharetra nulla, laoreet tristique lacus enim at dui. Donec non nisl molestie, semper lacus at, ornare urna. Nunc hendrerit eu magna nec vulputate. Vivamus iaculis dictum ultricies. Morbi at dictum lectus. Aenean non imperdiet orci, in condimentum metus. Duis hendrerit lorem non odio feugiat, a iaculis erat rhoncus. Mauris ac neque in sem vehicula egestas. Donec molestie ligula ut aliquet efficitur. Sed tristique metus nibh, a tempus urna ornare eget.',
                style: textTheme.bodyText1.copyWith(fontSize: 16),
                textAlign: TextAlign.justify),
            Padding(
              padding: EdgeInsets.only(top: 30, bottom: 10, left: 40),
              child: Text('Contact', style: textTheme.headline2),
            ),
            ContactForm()
          ],
        ),
      ),
    );
  }
}
