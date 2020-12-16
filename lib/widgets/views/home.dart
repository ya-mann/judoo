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
            final News data = snapshot.hasData ? snapshot.data : null;

            return SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(6, 30, 6, 30),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 380,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Photo and title.
                            SizedBox(
                              height: 245.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: Ink.image(
                                      image: NetworkImage(data?.thumbnailUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 16.0,
                                    left: 16.0,
                                    right: 16.0,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        data?.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline5
                                            .copyWith(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                shadows: [
                                              Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 10,
                                                  offset:
                                                      Offset.fromDirection(0))
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Description and share/explore buttons.
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  16.0, 16.0, 16.0, 0.0),
                              child: DefaultTextStyle(
                                softWrap: false,
                                style: Theme.of(context).textTheme.subtitle1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // three line description
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        data?.description,
                                        softWrap: true,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1
                                            .copyWith(color: Colors.black54),
                                      ),
                                    ),
                                    Text(data?.tag, style: TextStyle(color: Colors.deepPurple[500])),
                                    Text(data?.date, style: TextStyle(color: Colors.deepPurple[300]),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
