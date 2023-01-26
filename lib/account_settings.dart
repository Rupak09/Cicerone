import 'package:cicerone_project/show_error_dialog.dart';
import 'package:cicerone_project/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cicerone_project/firebase_options.dart';


class AccPage extends StatefulWidget {
  const AccPage({super.key});

  @override
  State<AccPage> createState() => _AccPageState();
}

String uname = '';
String umail = '';

class _AccPageState extends State<AccPage> {
  late final TextEditingController _Username;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmpsd;

  @override
  void initState() {
    _Username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpsd = TextEditingController();
    final user = FirebaseAuth.instance.currentUser;
    String? temp = user?.displayName;
    uname = temp.toString();
    temp = user?.email;
    umail = temp.toString();
    super.initState();
  }

  @override
  void dispose() {
    _Username.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpsd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account Settings'),
          backgroundColor: Colors.green.shade700,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/profilepic.jpg')),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _Username,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    icon: const Icon(
                      Icons.person,
                      color:Colors.black87,
                  ),
                    labelText: '$uname',
                    labelStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    icon: Icon(
                    Icons.email,
                    color: Colors.black87,
                  ),
                    labelText: '$umail',
                    labelStyle: const TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _password,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(
                    Icons.lock,
                    color: Colors.black87,),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: _confirmpsd,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(
                    Icons.lock,
                    color: Colors.black87,
                  ),
                    labelText: 'Confirm Password',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.normal)),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Submit'),
                      
              
      
            
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      await Firebase.initializeApp(
                        options: DefaultFirebaseOptions.currentPlatform,
                      );
                      final email = _email.text;
                      final password = _password.text;
                      if (_password.text == _confirmpsd.text) {
                        try {
                          final user = FirebaseAuth.instance.currentUser;
                          user?.updateEmail(email);
                          user?.updateDisplayName(_Username.text);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            await showErrorDialog(context, 'Weak Password!');
                          } else if (e.code == 'invalid-email') {
                            await showErrorDialog(
                                context, 'Invalid Email Adress');
                          } else {
                            await showErrorDialog(context, 'Error: ${e.code}');
                          }
                        }
                      } else {
                        await showErrorDialog(
                            context, 'Confirm Password Does not match with Password!');
                      }Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const loginScreen()));
                    },
                  )),
            ],
          ),
        ));
  }
  
}
