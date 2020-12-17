import 'package:flutter/material.dart';
import 'package:judoo/helpers/news.dart';
import 'package:url_launcher/url_launcher.dart';

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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Material(
                            color: Colors.white54,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            child: InkWell(
                              onTap: () => launch(data?.link, forceWebView: true),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              //color: Colors.white54,
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    RichText(
                                        textAlign: TextAlign.center,
                                        text: TextSpan(
                                            text: data?.title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                    color: Colors.blue[900]))),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data?.tag,
                                            style: TextStyle(
                                                color: Colors.black54)),
                                        Text(data?.date,
                                            style: TextStyle(
                                                color: Colors.black54))
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                child: Image.network(
                                                    data?.thumbnailUrl))),
                                        Flexible(
                                            child: Text(data?.description,
                                                softWrap: true))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
