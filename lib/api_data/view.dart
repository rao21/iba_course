import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iba_course/api_data/model.dart';
import 'package:http/http.dart' as http;

class ApiData extends StatefulWidget {
  const ApiData({super.key});

  @override
  State<ApiData> createState() => _ApiDataState();
}

class _ApiDataState extends State<ApiData> {
  Future<Album>? futureAlbum;

  @override
  void initState() {
    super.initState();
  }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        futureAlbum = fetchAlbum();
      }),
      body: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //api data 200
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            //api error
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
