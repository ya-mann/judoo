import 'package:flutter/material.dart';
import 'package:judoo/models/contact.dart';

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
