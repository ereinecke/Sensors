import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fl_geolocator.dart';

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

/// Card to display location sensors
final _locationSensors = Card(
  child: Column(
    children: <Widget>[
      Text('Location sensors', textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _readout('Longitude', '19.1234567'),
          _readout('Latitude', '-101.7654321'),
          _readout('Alt (m)', '2160'),
          _readout('Alt (ft)', '7086')
        ]
      ),
    ]
  ),
);

final _activityDetection = Card(
  child: Column(
    children: <Widget>[
      Text('Activity Detection', textAlign: TextAlign.left,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      ) ,
      Text('More goodies'),
    ]
  ),
);

/// Card to display fitness sensors
final _fitnessSensors = Card (
  child: Column(
      children: <Widget>[
        Text('Fitness sensors', textAlign: TextAlign.left,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
        ),
        Text('More goodies'),
      ]
  ),
);

Container _readout(String label, String value) {
  var readout = Container( 
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey),
    ),
    child: Column(
      children: [
        Text(value, textAlign: TextAlign.right,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
        ),
        Text(label, textAlign: TextAlign.center),
      ],
    ),
  );

  return readout;
}


/// Saves state for app
class _SensorsPageState extends State<SensorsPage> {
  bool updating = false;  // whether to run updates or not

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
            _locationSensors,
            _fitnessSensors,
            _activityDetection,
          ]
        ),
      ),
    );
  }
}
