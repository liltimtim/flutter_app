
import 'package:flutter_app/models/location_detail.dart';
import 'package:flutter_app/models/location_fact.dart';

class MockLocation extends LocationDetail {
  static LocationDetail FetchAny() {
    return LocationDetail(
      name: "Test Location",
      url: "https://images.unsplash.com/photo-1572530772193-db97f99b94ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=882&q=80",
      facts: [
        LocationFact(
          text: "This is a test fact",
          title: "Test Fact"
        )
      ]
    );
  }
}