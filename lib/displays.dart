/// Widgets that produce individual sensor displays
///
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

/// Card to display gyroscopic sensors
final gyroSensorsDisplay = Card(
  child: Container (
    color: Colors.teal[50],
    padding: const EdgeInsets.fromLTRB(8,8,8,12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Gyroscopic sensors',
          textAlign: TextAlign.start, style: TextStyle(fontSize: 18)),
        Row (
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[ Image(
            image: AssetImage('images/e-icon.png'),
            height: 50,
            width: 50,
          )],
        ),
  ]),
),
);

final activityDisplay = Card(
  child: Container (
    color: Colors.teal[50],
    padding: const EdgeInsets.fromLTRB(8,8,8,12),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Activity detection',
              textAlign: TextAlign.start, style: TextStyle(fontSize: 18)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                readout('Activity', 'coding'),
                readout('Or Maybe', 'snoozing'),
          ]),
        ]),
  ),
);

/// Card to display fitness sensors
final fitnessDisplay = Card(
  child: Container (
    color: Colors.teal[50],
    padding: const EdgeInsets.fromLTRB(8,8,8,12),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Fitness sensors',
              textAlign: TextAlign.start, style: TextStyle(fontSize: 18)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               readout('Steps', '10,000'),
               readout('Heart Rate', '72'),
          ]),
        ]),
  ),
);

/// Card to display network connections
final networkDisplay = Card(
  child: Container (
    color: Colors.teal[50],
    padding: const EdgeInsets.fromLTRB(8,8,8,12),

    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Network sensors',
              textAlign: TextAlign.start, style: TextStyle(fontSize: 18)),
          Row (
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[ Image(
              image: AssetImage('images/e-icon.png'),
              height: 50,
              width: 50,
            )],
          ),
        ],
    ),
  ),
);

Container readout(String label, String value) {
  var readout = Container(
    margin: const EdgeInsets.all(4),
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      border: Border.all(color: Colors.blueGrey)
      ),
    child: Column(
      children: [
        Text(value,
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 14)),
        Text(label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11),
        )],
    ),
  );

  return readout;
}
