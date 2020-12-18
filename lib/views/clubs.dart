import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:judoo/customIcons.dart';
import 'package:flutter/material.dart';
import 'package:judoo/models/club.dart';

import 'clubDetails.dart';

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
        location: LatLng(45.670658, 4.861367),
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
          initialCameraPosition:
              CameraPosition(target: club.location, zoom: 19),
          markers: {
            Marker(
              position: club.location,
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
