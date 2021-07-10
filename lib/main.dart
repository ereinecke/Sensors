import 'dart:developer' as developer;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loc_sensors/geolocation.dart';
import 'package:loc_sensors/gyro_sensors.dart';
import 'package:location/location.dart';

import 'get_location.dart';
import 'displays.dart';
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
  SensorsPage({Key? key, required this.title}) : super(key: key);

  final String title;
  // TODO(ereinecke): extend class Card to include show and detail booleans?

  @override
  SensorsPageState createState() => SensorsPageState();
}

/// Saves state for app
class SensorsPageState extends State<SensorsPage> {
  bool updating = false; // whether to run updates or not
  Location location = Location();
  // late LocationData locationData;
  final EnableInBackgroundWidget backgroundLocator = new EnableInBackgroundWidget();

  /// Store a snapshot of all sensor data collected
  void _saveSensors() {
    setState(() {
      // TODO(ereinecke): save backgroundLocator
      final snackBar =
          SnackBar(content: Text('Saving sensor data not yet implemented'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called.

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: <Widget>[
          /*
          IconButton(
            icon: Icon(Icons.cached),
            tooltip: 'Refresh',
            onPressed: { print('Refreshing....') },
          ) */
          IconButton(
            icon: updating ? Icon(Icons.play_arrow) : Icon(Icons.pause),
            tooltip: updating ? 'Continuous Updates' : 'Pause Updates',
            onPressed: () {
              setState(() {
                updating = !updating;

                /* toggleBackgroundMode(); */
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.save_alt),
            tooltip: 'Save location',
            onPressed: () => _saveSensors(),
          ),
        ]),
        body: Center(
          child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: <Widget>[
                backgroundLocator,
                GetLocationWidget(),
                gyroSensorsDisplay,
                fitnessDisplay,
                activityDisplay,
                networkDisplay,
              ]),
        ),
      ),
    );
  }
}
