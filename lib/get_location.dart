import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import 'displays.dart';

class GetLocationWidget extends StatefulWidget {
  const GetLocationWidget({Key? key}) : super(key: key);

  @override
  GetLocationState createState() => GetLocationState();
}

class GetLocationState extends State<GetLocationWidget> {
  Location location = Location();

  bool _loading = false;
  late bool serviceEnabled;
  late PermissionStatus _permissionGranted;

  LocationData? _location;
  String? _error;

  Future<void> getLocation() async {
    setState(() {
      _error = null;
      _loading = true;
    });
    try {
      final _locationResult = await location.getLocation();
      setState(() {
        _location = _locationResult;
        _loading = false;
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
        _loading = false;
      });
    }
  }

//TODO(ereinecke): localization

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container (
        color: Colors.teal[50],
        padding: const EdgeInsets.fromLTRB(8,8,8,12),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Location Sensors',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18)
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    readout('Longitude', getLatitude(_location)),
                    readout('Latitude', getLongitude(_location)),
                    readout('Alt (m)', getAltitudeMeters(_location)),
                    readout('Alt (ft)', getAltitudeFeet(_location)),
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    readout('Heading', getHeading(_location)),
                    readout('Speed', getSpeed(_location)),
                    readout('Accuracy', getAccuracy(_location)),
                    IconButton(
                      //TODO(ereinecke): Animate icon while updating
                      icon: Icon(Icons.cached),
                      onPressed: getLocation,
                    ),
                  ]),
      ]),
    ));
  }

  String getLatitude(LocationData? _location) {
    if (_location == null) {
      return "";
    } else return _location.latitude!.toStringAsFixed(4);
  }
  String getLongitude(LocationData? _location) {
    if (_location == null) {
      return "";
    } else return _location.longitude!.toStringAsFixed(4);
  }

  String getAltitudeMeters(LocationData? _location) {
    if (_location == null) {
      return "";
    } else return _location.altitude!.toStringAsFixed(0);
  }

  String getAltitudeFeet(LocationData? _location) {
    if (_location == null) {
      return "";
    } else {
      var _alt_meters = _location.altitude! * 3.28084;
      return _alt_meters.toStringAsFixed(0);
    }
  }

  String getHeading(LocationData? _location) {
    if (_location == null) {
      return "";
    } else return _location.heading!.toStringAsFixed(0);
  }

  String getSpeed(LocationData? _location) {
    if (_location == null) {
      return "";
    } else return _location.speed!.toStringAsFixed(0);
  }

  String getAccuracy(LocationData? _location) {
    if (_location == null) {
      return "";
    } else return _location.accuracy!.toStringAsFixed(0);
  }


}
