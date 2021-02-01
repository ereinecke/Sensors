/// Enable or disable location in the background
///
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class EnableInBackgroundWidget extends StatefulWidget {
  const EnableInBackgroundWidget({Key key}) : super(key: key);

  @override
  _EnableInBackgroundState createState() => _EnableInBackgroundState();
}

class _EnableInBackgroundState extends State<EnableInBackgroundWidget> {
  final Location location = Location();

  bool _enabled;
  String _error;

  @override
  void initState() {
    _checkBackgroundMode();
    super.initState();
  }

  Future<void> _checkBackgroundMode() async {
    setState(() {
      _error = null;
    });
    final bool result = await location.isBackgroundModeEnabled();
    setState(() {
      _enabled = result;
    });
  }

  Future<void> _toggleBackgroundMode() async {
    setState(() {
      _error = null;
    });
    try {
      final bool result =
      await location.enableBackgroundMode(enable: !(_enabled ?? false));
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
    return ;
  }


}
