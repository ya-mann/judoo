import 'package:flutter/material.dart';
import 'package:judoo/models/club.dart';

class ClubDetails extends StatelessWidget {
  final Club data;
  ClubDetails({this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
          child: Center(
              child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data.name,
              style: textTheme.headline1.copyWith(fontSize: 24),
              textAlign: TextAlign.center),
          SizedBox(height: 10),
          Text(data.description,
              style: textTheme.bodyText1
                  .copyWith(fontSize: 18),
              textAlign: TextAlign.justify),
          SizedBox(height: 15),
          Table(
            border: TableBorder.all(),
            children: [
              TableRow(children: [
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Jour",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold)))),
                TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Horaires",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold))))
              ]),
              ...data.timetable.entries.map((e) {
                return TableRow(children: [
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(e.key, textAlign: TextAlign.center))),
                  TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(e.value.join('\n'),
                              textAlign: TextAlign.center)))
                ]);
              }).toList()
            ],
          ),
          SizedBox(height: 20),
          Image.network(data.image)
        ],
      ))),
    );
  }
}
