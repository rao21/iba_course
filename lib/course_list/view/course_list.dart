// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iba_course/course_list/data/course_data.dart';

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
          title: const Text('Course Lists'),
          centerTitle: true,
        ),
        drawer: const CustomDrawer(),
        body: ListView.builder(
            itemCount: data.length,
            itemBuilder: ((ctx, i) {
              return _item(item: data[i]);
            })));
  }

  Widget _item({required CourseModel item}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        color: Colors.grey[50],
        elevation: 2,
        child: Column(
          children: [
            ListTile(
              onTap: () => {
                showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: Column(
                        children: [
                          // const SizedBox(
                          //   height: 16,
                          // ),
                          Row(
                            children: [
                              const Icon(Icons.close_rounded),
                              const Spacer(),
                              Text(item.name),
                              const Spacer(),
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: item.lecture.length,
                              itemBuilder: ((ctx, i) {
                                return ExpansionTile(
                                  backgroundColor: Colors.grey[50],
                                  collapsedBackgroundColor: Colors.yellow,
                                  title: Text(
                                    item.lecture[i].name,
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  children: <Widget>[
                                    Text(item.lecture[i].link,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500))
                                  ],
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  // shape: const RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.vertical(
                  //     top: Radius.circular(20),
                  //   ),
                  // ),
                )
              },
              leading: SizedBox(
                  height: 24, width: 24, child: SvgPicture.asset(item.icon)),
              title: Text(item.name),
              subtitle: Text(
                item.code,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                item.description,
                style: const TextStyle(color: Colors.black),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Show course content'),
                ),
              ],
            ),
          ],
        ),
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
