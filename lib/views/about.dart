import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
              padding: EdgeInsets.only(top: 30, bottom: 10, left: 50),
              child: Text('Contact', style: textTheme.headline2),
            ),
            ContactForm()
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  var _nameController = TextEditingController();
  var _emailController = TextEditingController();
  var _subjectController = TextEditingController();
  var _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Votre email',
              ),
              controller: _emailController,
              validator: (value) {
                return value.isEmpty ? 'Veuillez saisir votre email.' : null;
              }),
          TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Votre nom',
              ),
              controller: _nameController,
              validator: (value) {
                return value.isEmpty ? 'Veuillez saisir votre nom.' : null;
              }),
          TextFormField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Le sujet',
              ),
              controller: _subjectController,
              validator: (value) {
                return value.isEmpty ? 'Veuillez saisir le sujet.' : null;
              }),
          TextFormField(
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                hintText: 'Le contenu',
              ),
              controller: _contentController,
              validator: (value) {
                return value.isEmpty ? 'Veuillez saisir le contenu.' : null;
              }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              onPressed: () {
                if (!_formKey.currentState.validate()) return;
                var snackBar = Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Soumission en cours...')));
                Contact.addContact(Contact(
                        email: _emailController.text,
                        name: _nameController.text,
                        content: _contentController.text,
                        subject: _subjectController.text))
                    .then((value) {
                  snackBar.close();
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Soumis avec succès.'),
                      duration: Duration(seconds: 1)));
                }).catchError((error) {
                  snackBar.close();
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Une erreur est survenue, veuillez réesayer plus tard...\nErreur : "${error.toString()}"'),
                      duration: Duration(seconds: 3)));
                });
                _emailController.clear();
                _nameController.clear();
                _contentController.clear();
                _subjectController.clear();
              },
              child: Text('Soumettre'),
            ),
          ),
        ],
      ),
    );
  }
}
