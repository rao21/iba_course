import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iba_course/mid/model.dart';
import 'package:http/http.dart' as http;



class MakeUpProducts extends StatefulWidget {
  const MakeUpProducts({super.key});

  @override
  State<MakeUpProducts> createState() => _MakeUpProductsState();
}

class _MakeUpProductsState extends State<MakeUpProducts> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<List<APIDataModel>> _fetchData() async {
    final response = await http.get(Uri.parse(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));

    if (response.statusCode == 200) {
      var modelJson = jsonDecode(response.body) as List;
      List<APIDataModel> reponse =
          modelJson.map((tagJson) => APIDataModel.fromJson(tagJson)).toList();
      return reponse;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
      body: FutureBuilder<List<APIDataModel>>(
        future: _fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, i) {
                  var item = snapshot.data![i];
                  return Card(
                    shadowColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            builder: (contxt) => Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: SizedBox(
                                          height: 48,
                                          width: 48,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.orange,
                                            backgroundImage: NetworkImage(
                                              item.imageLink!,
                                            ),
                                          ),
                                        ),
                                        title: Text(item.name!),
                                        subtitle: Text(item.description!),
                                      ),
                                      SizedBox(
                                        height: 48,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                                text: TextSpan(
                                                    text: "Brand:",
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          ' ${item.brand?.toUpperCase()}',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 18))
                                                ])),
                                            RichText(
                                                text: TextSpan(
                                                    text: "Price:",
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                      text: ' \$',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18)),
                                                  TextSpan(
                                                      text: '${item.price}',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 18))
                                                ]))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 48,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                                text: TextSpan(
                                                    text: "Product Type:",
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                      text:
                                                          ' ${item.productType?.toUpperCase()}',
                                                      style: TextStyle(
                                                          color:
                                                              Color(0XFFCF9978),
                                                          fontSize: 16))
                                                ])),
                                            RichText(
                                                text: TextSpan(
                                                    text: "Rating:",
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    children: <TextSpan>[
                                                  TextSpan(
                                                      text: ' ${item.rating}',
                                                      style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 16))
                                                ])),
                                          ],
                                        ),
                                      ),
                                      if (item.productColors!.isNotEmpty)
                                        SizedBox(
                                          height: 48,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              reverse: true,
                                              itemCount:
                                                  item.productColors!.length,
                                              itemBuilder: (cont, i) {
                                                var color = item
                                                    .productColors![i].hexValue!
                                                    .replaceFirst(
                                                        RegExp(r'#'), '0xFF');
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 4.0),
                                                  child: SizedBox(
                                                    height: 24,
                                                    width: 24,
                                                    child: CircleAvatar(
                                                      backgroundColor: Color(
                                                          int.parse(color)),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      SizedBox(
                                        height: 8,
                                      )
                                    ],
                                  ),
                                ));
                      },
                      title: Text(item.name!),
                      leading: Image.network(item.imageLink!),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("\$ ${item.price!}"),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<DrawerModel> _drawerModel = <DrawerModel>[
    DrawerModel(title: 'Shop', url: 'shop'),
    DrawerModel(title: 'Profile', url: 'profile'),
    DrawerModel(title: 'Login', url: 'login'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Rao'),
            accountEmail: Text('rao@yahoo.com'),
            currentAccountPicture: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/14454924/pexels-photo-14454924.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: Text('Home'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}

class DrawerModel {
  final String title;
  final String url;

  DrawerModel({required this.title, required this.url});
}
