import 'package:cicerone_project/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cicerone_project/account_settings.dart';
import 'package:cicerone_project/map_screen.dart';
import 'package:cicerone_project/sample_map.dart';
import 'package:cicerone_project/show_error_dialog.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

String ne = '';

class _HomePageState extends State<HomePage> {
  final List<String> nodes = [
    'The Great Hall',
    'Egyptian Art',
    'Arms and Armors',
    'European Sculpture and Decorative Arts',
    'Medieval Arts',
  ];
  final Map node = {
    'The Great Hall': 1,
    'Egyptian Art': 2,
    'Arms and Armors': 3,
    'European Sculpture and Decorative Arts': 4,
    'Medieval Arts': 5,
  };
  String? src;
  String? dest;
  String? nm;
  @override
  void initState() {
    final user = FirebaseAuth.instance.currentUser;
    nm = user?.displayName;
    ne = nm.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cicerone'),
        backgroundColor: Colors.green.shade700,
      ),
      drawer: const NavigationDrawer(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              isExpanded: true,
              hint: const Text(
                'Select Source',
                style: TextStyle(fontSize: 14),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              items: nodes
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please Select Source';
                }
              },
              onChanged: (value) {
                src = value.toString();
              },
              onSaved: (value) {
                src = value.toString();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField2(
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              isExpanded: true,
              hint: const Text(
                'Select Destination',
                style: TextStyle(fontSize: 14),
              ),
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,
              buttonPadding: const EdgeInsets.only(left: 20, right: 10),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              items: nodes
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please Select Destination';
                }
              },
              onChanged: (value) {
                dest = value.toString();
              },
              onSaved: (value) {
                dest = value.toString();
              },
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  if (src == null || dest == null) {
                    showErrorDialog(context,
                        'Source or Destination Fields cannot be null!');
                  } else if (src == dest) {
                    showErrorDialog(
                        context, 'Source and Destination cannot be same!');
                  } else {
                    int from = node[src];
                    int to = node[dest];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Mappage(
                                  from: from,
                                  to: to,
                                )));
                  }
                },
                child: const Text('Navigate'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SampleMap(),
                    ),
                  );
                },
                child: const Text('Map View'))
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
}

Widget buildHeader(BuildContext context) => Material(
      color: Colors.green.shade700,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        },
        child: Container(
          color: Colors.green.shade700,
          padding: EdgeInsets.only(
            top: 24 + MediaQuery.of(context).padding.top,
            bottom: 24,
          ),
          child: Column(
            children: [
              const CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/profilepic.jpg')),
              const SizedBox(height: 12),
              Text(
                '$ne',
                style: const TextStyle(fontSize: 28, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );

Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.account_box),
          title: const Text('Account settings'),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const AccPage(),
            ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log out'),
          onTap: () {
            final FirebaseAuth auth = FirebaseAuth.instance;
            signOut() async {
              await auth.signOut();
            }

            signOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SignupPage()));
          },
        ),
      ],
    ));
