import 'package:flutter/material.dart';
import 'package:judoo/models/news.dart';
import 'package:judoo/components/news.dart' as component;
import 'package:judoo/views/about.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static const name = 'Accueil';
  static const icon = Icon(Icons.home_rounded, size: 28);

  @override
  Widget build(BuildContext context) {
    final news = News.getNews(numberOfNews: 5);
    return Scaffold(
      body: FutureBuilder<List<News>>(
          future: news,
          builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
            final newsWidgets = snapshot.hasData
                ? snapshot.data.map((data) {
                    return component.News(data: data);
                  }).toList()
                : [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white54,
                      ),
                      height: 150,
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Center(
                        child: snapshot.hasError
                            ? Icon(Icons.error_rounded, color: Colors.red)
                            : CircularProgressIndicator(),
                      ),
                    )
                  ];
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Text('Actualité',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                .copyWith(fontSize: 22),
                            textAlign: TextAlign.left),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.help_outline_rounded,
                            color: Colors.blue[500],
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
                          })
                    ],
                  )),
                  ...newsWidgets
                ],
              ),
            );
          }),
    );
  }
}
