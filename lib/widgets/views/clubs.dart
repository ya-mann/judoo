import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:judoo/customIcons.dart';
import 'package:flutter/material.dart';

class Club {
  String name, address, image, description;
  LatLng coords;
  Map<String, List<String>> timetable;
  Club(
      {this.name,
      this.image,
      this.description,
      this.address,
      this.coords,
      this.timetable});
}

class ClubsPage extends StatefulWidget {
  const ClubsPage({Key key}) : super(key: key);
  static const name = 'Clubs';
  static const icon = Icon(CustomIcons.kimono, size: 28);

  State<ClubsPage> createState() => ClubsPageState();
}

class ClubsPageState extends State<ClubsPage> {
  Completer<GoogleMapController> _controller = Completer();
  var isSatelliteMode = true;

  @override
  Widget build(BuildContext context) {
    final club = Club(
        name: 'Judo Club Feyzin',
        coords: LatLng(45.670658, 4.861367),
        address: '4 Chemin sous le Fort, 69320 Feyzin',
        image:
            'https://judoclubfeyzin.sportsregions.fr/muc-416-416/9400/albumphoto/5c2fc0f769527_IMG20181220181431.jpg',
        description: 'Un super club.',
        timetable: {
          'Lundi': ['Fermé'],
          'Mardi': ['17:30-18:30', '18:30-19:30', '19:30-20:30'],
          'Mercredi': ['Fermé'],
          'Jeudi': ['17:30-18:30', '18:30-19:30', '19:30-20:30'],
          'Vendredi': ['Fermé'],
          'Samedi': ['Fermé'],
          'Dimanche': ['Fermé']
        });
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          mapType: isSatelliteMode ? MapType.satellite : MapType.normal,
          initialCameraPosition: CameraPosition(target: club.coords, zoom: 19),
          markers: {
            Marker(
              position: club.coords,
              markerId: MarkerId(club.name),
              infoWindow: InfoWindow(
                  title: club.name,
                  snippet: club.address,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClubDetails(data: club)));
                  }),
            )
          },
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => setState(() => isSatelliteMode = !isSatelliteMode),
          label: Text(isSatelliteMode ? 'Plan' : 'Satellite')),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

class ClubDetails extends StatelessWidget {
  Club data;
  ClubDetails({this.data, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
              child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(this.data.name,
              style:
                  Theme.of(context).textTheme.headline1.copyWith(fontSize: 24),
              textAlign: TextAlign.center),
          SizedBox(height: 10),
          Text(this.data.description,
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18, fontWeight: FontWeight.normal),
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
              ...this.data.timetable.entries.map((e) {
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
          Image.network(this.data.image)
        ],
      ))),
    );
  }
}
