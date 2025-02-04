import 'package:uuid/uuid.dart';
import 'dart:io';

const uuid = Uuid();

class PlaceLocation {
  const PlaceLocation({
    required this.address,
    required this.longitude,
    required this.lattitude,
  });
  final double lattitude;
  final double longitude;
  final String address;
}

class Place {
  Place({
    required this.title,
    required this.image,
    required this.location,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final File image;
  final PlaceLocation location;
}
