import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Wraps platform-specific persistent storage for simple data (NSUserDefaults on iOS and macOS,
//SharedPreferences on Android, etc.).
//Data may be persisted to disk asynchronously,

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {
  String data = '';
  @override
  void initState() {
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Pref'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          removeData();
        },
        child: const Text('Clear'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setString('data', value.toString());
              readData();
            },
          ),
          Text(data)
        ],
      ),
    );
  }

  Future<void> readData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    data = prefs.getString('data') ?? '';
    setState(() {});
  }

  Future<void> removeData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('data');
    data = prefs.getString('data') ?? '';
    setState(() {});
  }
}
