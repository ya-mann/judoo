import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:judoo/helpers/news.dart';

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
            final News data = snapshot.hasData ? snapshot.data : null;
            return SafeArea(
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Actualité',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500))),
                Card(
                  child: Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(data?.thumbnailUrl),
                            title: RichText(
                              text: TextSpan(
                                  text: data?.title,
                                  style: TextStyle(color: Colors.blue)),
                            ),
                            subtitle: Text(data?.description),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextButton(
                                child: const Text('En savoir plus...'),
                                onPressed: () => debugPrint("pressed"),
                              ),
                            ],
                          ),
                        ],
                      )),
                )
              ]),
            );
          }),
    );
  }
}
