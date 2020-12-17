import 'package:flutter/material.dart';
import 'package:judoo/helpers/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsWidget extends StatelessWidget {
  News data;
  NewsWidget({this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: InkWell(
          onTap: () => launch(this.data.link, forceWebView: true),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          //color: Colors.white54,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: this.data.title,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Colors.blue[900]))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(this.data.tag, style: TextStyle(color: Colors.black54)),
                    Text(this.data.date, style: TextStyle(color: Colors.black54))
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Image.network(this.data.thumbnailUrl))),
                    Flexible(child: Text(this.data.description, softWrap: true))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  static const name = 'Accueil';
  static const icon = Icon(Icons.home_rounded, size: 28);

  @override
  Widget build(BuildContext context) {
    final news = News.get(numberOfNews: 2);
    return Scaffold(
      body: FutureBuilder<List<News>>(
          future: news,
          builder: (BuildContext context, AsyncSnapshot<List<News>> snapshot) {
            final newsWidgets = snapshot.hasData ? snapshot.data.map((data) {
              return NewsWidget(data: data);
            }).toList() : [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white54,
                ),
                height: 150,
                //borderRadius: BorderRadius.all(Radius.circular(15)),
                child: Center(
                  child: snapshot.hasError ? Icon(Icons.error_rounded, color: Colors.red) : CircularProgressIndicator(),
                ),
              )
            ];
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView(
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      children: newsWidgets,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
