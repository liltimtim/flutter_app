// Flutter code sample for

// This example shows a [Form] with one [TextFormField] and a [RaisedButton]. A
// [GlobalKey] is used here to identify the [Form] and validate input.

import 'package:flutter/material.dart';
import 'package:flutter_app/location_details.dart';
import 'package:flutter_app/mocks/mock_location.dart';
import 'package:flutter_app/models/location_detail.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(25),
                  child: MyStatefulWidget()
              )
            ]
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  LocationDetail detail = MockLocation.FetchAny();

  String validate(String value, String message) {
    if (value.isEmpty) {
      return message;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("username"),
          TextFormField(
            validator: (value) => validate(value, 'Please enter some text'),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text("password"),
          ),
          TextFormField(
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => validate(value, 'Please enter password'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: RaisedButton(
              onPressed: () {

                if (_formKey.currentState.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder:
                          (context) => LocationDetails(detail)
                      )
                  );
                }
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}