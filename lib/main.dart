import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'displays.dart';
import 'geolocation.dart';
import 'location.dart';
import 'gyro_sensors.dart';
import 'enable_in_background.dart';

void main() {
  runApp(Sensors());
}

class Sensors extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensors',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SensorsPage(title: 'Sensors'),
    );
  }
}

/// Main (and only screen): SensorsPage
class SensorsPage extends StatefulWidget {
  SensorsPage({Key key, this.title}) : super(key: key);

  final String title;
  // TODO: extend class Card to include show and detail booleans?

  @override
  _SensorsPageState createState() => _SensorsPageState();
}

/// Saves state for app
class _SensorsPageState extends State<SensorsPage> {
  bool updating = false;  // whether to run updates or not
  final Location location = Location();
  LocationData locationData;

  /// Store a snapshot of all sensor data collected
  void _saveSensors() {
    setState(() {
      final snackBar = SnackBar(content: Text('Saving sensor data not yet implemented'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: updating ? Icon(Icons.play_arrow) : Icon(Icons.pause),
            tooltip: updating ? 'Continuous Updates' : 'Pause Updates',
            onPressed: () {
              setState(() {
                updating = !updating;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.save_alt),
            tooltip: 'Save location',
            onPressed: () => _saveSensors(),
          ),
        ]
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            locationDisplay,
            gyroSensorsDisplay,
            fitnessDisplay,
            activityDisplay,
            EnableInBackgroundWidget(),
          ]
        ),
      ),
    );
  }
}
