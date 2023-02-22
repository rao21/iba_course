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
  Future<List<Comments>>? futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  Future<List<Comments>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));

    if (response.statusCode == 200) {
      var commentsjson = jsonDecode(response.body) as List;
      List<Comments> tagObjs =
          commentsjson.map((tagJson) => Comments.fromJson(tagJson)).toList();

      return tagObjs;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Comments>>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //api data 200
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  return Card(
                    shadowColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        var comment = snapshot.data![i];
                        showModalBottomSheet<void>(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(32),
                            ),
                          ),
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 150,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Name: ${comment.name}"),
                                      Text("Email: ${comment.email}"),
                                      Text("Body: ${comment.body}"),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      title: Text(snapshot.data![i].name),
                      leading: CircleAvatar(
                          child: Text(snapshot.data![i].id.toString())),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
