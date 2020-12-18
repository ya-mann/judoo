import 'package:google_maps_flutter/google_maps_flutter.dart';

class Club {
  String name, address, image, description;
  LatLng location;
  Map<String, List<String>> timetable;
  Club(
      {this.name,
      this.image,
      this.description,
      this.address,
      this.location,
      this.timetable});
}
