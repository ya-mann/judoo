import 'package:flutter/material.dart';
import 'package:judoo/helpers/getNews.dart';
import 'package:judoo/widgets/navigationBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static const name = 'Accueil';
  static const icon = Icon(Icons.home_rounded, size: 28);

  @override
  Widget build(BuildContext context) {
    final news = News.get();
    return Scaffold(
      body: FutureBuilder<News>(
        future: news,
        builder: (BuildContext context, AsyncSnapshot<News> snapshot) {
          List<Widget> child;
          if (snapshot.hasData) {
            child = [
              Text(snapshot.data.title,
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
              Image.network(snapshot.data.thumbnailUrl),
              Text(snapshot.data.description,
                  style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
              Text(snapshot.data.date,
                  style: TextStyle(fontSize: 12), textAlign: TextAlign.center),
            ]; // temporairement
          } else if (snapshot.hasError) {
            child = [
              Icon(
                Icons.error_outline_rounded,
                color: Colors.red,
                size: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Une erreur est survenue, veuillez réesayer plus tard.',
                  textAlign: TextAlign.center,
                ),
              )
            ];
          } else {
            child = [
              SizedBox(
                child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(Colors.blue[700])),
                width: 45,
                height: 45,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Chargement en cours...'),
              )
            ];
          }
          return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: child));
        },
      ),
    );
  }
}
