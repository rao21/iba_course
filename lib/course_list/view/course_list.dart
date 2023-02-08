// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iba_course/course_list/data/course_data.dart';
import 'package:iba_course/login.dart';

import '../data/dummy_data.dart';

class CourseListWidget extends StatefulWidget {
  const CourseListWidget({super.key});
  
  @override
  State<CourseListWidget> createState() => _CourseListWidgetState();
}

class _CourseListWidgetState extends State<CourseListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List'),
          centerTitle: true,
        ),
        drawer: CustomDrawer(),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: ((ctx, i) {
              return _item(item: data[i]);
            })));
  }

  Widget _item({required CourseModel item}) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.arrow_drop_down_circle),
            title: Text(item.name),
            subtitle: Text(
              item.code,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Image.asset(
            'assets/images/card_img.jpg',
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 1'),
              ),
              FlatButton(
                textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('ACTION 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Ali'),
            accountEmail: Text('ali@iba.com'),
            currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/icons/avatar.jpg')),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              // Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) =>
              //             const MobileLoginForm()));
            },
          ),
        ],
      ),
    );
  }
}
