import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannels extends StatefulWidget {
  const PlatformChannels({super.key});

  @override
  State<PlatformChannels> createState() => _PlatformChannelsState();
}

class _PlatformChannelsState extends State<PlatformChannels> {
  // Step#1 Platform channel name.
  static const platform = MethodChannel('samples.flutter.dev/battery');

  //Step#2 Create a key for channel.
  String _platformKey = 'getBatteryLevel';


  
  String _platformAddNumberMap = 'addNmbers';

  String _channelResult = 'Not implemented';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(title: const Text('Platform')),
        floatingActionButton: FloatingActionButton(onPressed: () {
          _addNumbers();
        }),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Center(child: Text(_channelResult))],
        ),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    //Invoke native code.
    String _level = '';
    try {
      final int result = await platform.invokeMethod(_platformKey);
      print(result);
      _level = '$result';
    } on PlatformException catch (e) {
      _channelResult = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _channelResult = _level;
    });
  }

  Future<void> _addNumbers() async {
    //Just to passing a Map<String,String> ....
    var result;
    try {
      result = await platform
          .invokeMapMethod(_platformAddNumberMap, <String, dynamic>{
        'n1': 50,
        'n2': 10,
        'n3': 30,
      });
      log(result.toString());
    } on PlatformException catch (e) {
      _channelResult = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _channelResult = result["Sum"].toString();
    });
  }
}
