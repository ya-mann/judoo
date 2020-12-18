import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:judoo/models/news.dart' as model;

class News extends StatelessWidget {
  final model.News data;
  News({this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Material(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: InkWell(
              onTap: () => launch(data.link, forceWebView: true),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              //color: Colors.white54,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: data.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(color: Colors.blue[900]))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.tag,
                            style: TextStyle(color: Colors.black54)),
                        Text(data.date,
                            style: TextStyle(color: Colors.black54))
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.network(data.thumbnailUrl))),
                        Flexible(
                            child: Text(data.description, softWrap: true))
                      ],
                    )
                  ],
                ),
              ),
            )));
  }
}
