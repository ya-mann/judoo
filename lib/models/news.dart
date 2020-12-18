import 'dart:convert';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

class News {
  String link, title, thumbnailUrl, description, tag, date;
  News(
      {this.link,
      this.title,
      this.thumbnailUrl,
      this.description,
      this.tag,
      this.date});

  static Future<List<News>> getNews({numberOfNews: 1}) async {
    final response =
        await http.get(Uri.parse('https://www.ffjudo.com/actualites/'));
    List<News> news = [];
    if (response.statusCode == 200) {
      final document = parse(utf8.decode(response.bodyBytes));
      final newsBlock =
          document.querySelectorAll('.listing_bloc').getRange(0, numberOfNews);
      newsBlock.forEach((element) {
        final newsHeader = element.getElementsByTagName('a').first;
        news.add(News(
          link: newsHeader.attributes['href'],
          title: newsHeader.text,
          thumbnailUrl:
              element.getElementsByTagName('img').first.attributes['src'],
          description: element.querySelector('p.clearfix').text,
          tag: element.getElementsByClassName('lieux').first.text,
          date: element.getElementsByClassName('date').first.text.substring(3),
        ));
      });
    }
    return news;
  }
}
