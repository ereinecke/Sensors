
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';

import 'displays.dart';
import 'enable_in_background.dart';
import 'get_location.dart';
import 'permission_status.dart';

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

  // TODO(ereinecke): Settings widget for display options (on/off, units)
  // TODO(ereinecke): Map for permission, service statuses?

  @override
  SensorsPageState createState() => SensorsPageState();

  Future<bool>? requestAndSetPermissions;
}


/// Saves state for app
class SensorsPageState extends State<SensorsPage> {
  // global state variables
  bool updating = false; // whether to run updates or not
  bool locServiceEnabled = false ;
  late PermissionStatus permissionGranted;
  /*
  final PermissionStatusWidget getPermissions = new PermissionStatusWidget();
    */
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
      printGlobals();

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
                PermissionStatusWidget(),
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

  // printGlobals for debugging
  void printGlobals() {
    // print('getPermissions:' + getPermissions.toString());
    print('updating:' + updating.toString());
  }
}
