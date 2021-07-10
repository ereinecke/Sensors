import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class GetLocationWidget extends StatefulWidget {
  const GetLocationWidget({Key? key}) : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocationWidget> {
  final Location location = Location();

  bool _loading = false;

  LocationData? _location;
  String? _error;

  Future<void> _getLocation() async {
    setState(() {
      _error = null;
      _loading = true;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
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
/*
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Location: ' + (_error ?? '${_location ?? "unknown"}'),
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Row(
          children: <Widget>[
            ElevatedButton(
              child: _loading
                  ? const CircularProgressIndicator(
                color: Colors.white,
              )
                  : const Text('Get'),
              onPressed: _getLocation,
            )
          ],
        ),
      ],
    );
*/
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
              Text('Location sensors',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 18)
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _readout('Longitude', getLatitude()),
                    _readout('Latitude', getLongitude()),
                    _readout('Alt (m)', getAltitudeMeters()),
                    _readout('Alt (ft)', getAltitudeFeet())
                  ]),
            ]),
      ),
    );

  }
}
