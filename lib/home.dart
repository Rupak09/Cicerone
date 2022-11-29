import 'package:cicerone_project/accountSettings.dart';
import 'package:cicerone_project/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.green.shade700,
      ),
      drawer: const NavigationDrawer(),
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
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              ),
              SizedBox(height: 12),
              Text(
                'Username',
                style: TextStyle(fontSize: 28, color: Colors.white),
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
        /*ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Account settings'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('About us'),
          onTap: () {},
        ),*/

        ListTile(
          leading: const Icon(Icons.account_box),
          title: const Text('Settings'),
          onTap: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const settingsPage(),));
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
        const SizedBox(
          width: 40,
          height: 160,
        ),
        const Divider(color: Colors.black54),
        ListTile(
          leading: const Icon(Icons.people),
          title: const Text('About us'),
          onTap: () {},
        ),
      ],
    ));
