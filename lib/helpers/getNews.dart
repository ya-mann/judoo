import 'dart:convert';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class News {
  String link, title, thumbnailUrl, description, tag, date;
  News({this.link, this.title, this.thumbnailUrl, this.description, this.tag, this.date});

  static Future<News> get() async {
    final response =
        await http.get(Uri.parse('https://www.ffjudo.com/actualites/'));
    News news;
    if (response.statusCode == 200) {
      final document = parse(utf8.decode(response.bodyBytes));
      final newsHeader = document.querySelector('.listing_bloc a');
      news = News(
        link: newsHeader.attributes['href'],
        title: newsHeader.text,
        thumbnailUrl: document.querySelector('.listing_bloc img').attributes['src'],
        description: document.querySelector('.listing_bloc p.clearfix').text,
        tag: document.querySelector('.listing_bloc .lieux').text,
        date:  document.querySelector('.listing_bloc .date').text.substring(3),
      );
    }
    return news;
  }
}
