
import 'package:flutter_app/models/location_fact.dart';

class LocationDetail {
  final String name;
  final String url;
  final List<LocationFact> facts;
  LocationDetail({
    this.name,
    this.url,
    this.facts});
}