/// Enable or disable location in the background
/// Code for location package
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
export 'main.dart';

class EnableInBackgroundWidget extends StatefulWidget {
  const EnableInBackgroundWidget({Key? key}) : super(key: key);

  @override
  EnableInBackgroundState createState() => EnableInBackgroundState();
}

class EnableInBackgroundState extends State<EnableInBackgroundWidget> {
  final Location location = Location();

  bool _enabled = false;
  String _error = '';

  @override
  void initState() {
    checkBackgroundMode();
    super.initState();
  }

  Future<void> checkBackgroundMode() async {
    setState(() {
      _error = '';
    });
    final bool result = await location.isBackgroundModeEnabled();
    setState(() {
      _enabled = result;
    });
  }

  Future<void> toggleBackgroundMode() async {
    setState(() {
      _error = '';
    });
    try {
      final result =
        await location.enableBackgroundMode(enable: !(_enabled ? false : true));
      setState(() {
        _enabled = result;
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
      });
    }
  }

  /*
   * contains the onpressed logic for checking status and taking readings
   */
  @override
  Widget build(BuildContext context) {
    String status = "";
    if (_error != null) {
      status = "Aquisition error: " + _error;
    } else {
      if (_enabled) {status = "Aquiring sensor data";}
      else {status = "Aquisition paused";}
    }
    // TODO: figure out what to return as the actual widget with no display.
    return
      Text(status,
        textAlign: TextAlign.center);
  }
}
