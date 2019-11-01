import "package:flutter/material.dart";
import 'package:flutter_app/models/location_detail.dart';
import 'package:flutter_app/models/location_fact.dart';

class LocationDetails extends StatelessWidget {
  final LocationDetail location;

  LocationDetails(this.location);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(this.location.name),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _sections(location),
      ),
    );
  }

  List<Widget> _sections(LocationDetail detail) {
    var result = List<Widget>();
    result.add(_bannerImage(detail.url, 170));
    for(var i = 0; i < detail.facts.length; i++) {
      result.add(_sectionTitle(detail.facts[i].title));
      result.add(_section(detail.facts[i].text));
    }
    return result;
  }

  Widget _sectionTitle(String title) {
    return Container(
      child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          )
      ),
      padding: EdgeInsets.fromLTRB(25, 25, 25, 25),
    );
  }

  Widget _section(String text) {
    return Container(
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.normal
        ),
      ),
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
    );
  }
  
  Widget _bannerImage(String url, double height) {
    return Container(
      constraints: BoxConstraints.tightFor(height: height),
      child: Image.network(url, fit: BoxFit.fitWidth,),
    );
  }
}

