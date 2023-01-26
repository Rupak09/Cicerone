import 'package:cicerone_project/show_error_dialog.dart';
import 'package:cicerone_project/verify_mail_view.dart';
import 'package:cicerone_project/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cicerone_project/firebase_options.dart';
import 'package:flutter/material.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmpsd;
  @override
  void initState() {
    _username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmpsd = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpsd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cicerone'),
          backgroundColor: Colors.green.shade700,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              const Text('Register Here!',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              TextField(
                controller: _username,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.green.shade700)),
                    icon: const Icon(
                      Icons.person,
                      color: Colors.black87,
                    ),
                    labelText: 'Username',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 12,
                        fontWeight: FontWeight.normal)),
              ),
              TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Colors.green.shade700)),
                  icon: Icon(
                    Icons.email,
                    color: Colors.black87,
                  ),
                  labelText: 'Email Id',
                  labelStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.normal),
                ),
              ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                icon: Icon(Icons.password,color: Colors.black87,),
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
            TextField(
              controller: _confirmpsd,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
               icon: Icon(Icons.password,color: Colors.black87,),
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
              Container(
                  padding: const EdgeInsets.all(8.0),
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
                      //final username = _username.text;
                      final email = _email.text;
                      final password = _password.text;
                      int flag = 0;
                       if (_password.text == _confirmpsd.text) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        final user = FirebaseAuth.instance.currentUser;
                        user?.updateDisplayName(_username.text);
                        await user?.sendEmailVerification();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VerifyEmailView()));
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          await showErrorDialog(context, 'Weak Password!');
                        } else if (e.code == 'email-already-in-use') {
                          await showErrorDialog(
                              context, 'Account already Exists!');
                        } else if (e.code == 'invalid-email') {
                          await showErrorDialog(
                              context, 'Invalid Email Adress');
                        } else {
                          await showErrorDialog(context, 'Error: ${e.code}');
                        }
                      }
                    } else {
                      await showErrorDialog(
                          context, ' Passwords does not match!');
                    }
                  },
                )),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const loginScreen()));
                },
                child: const Text(
                  'Already a user? Log in!',
                  style: TextStyle(color: Color(0Xff4fbf26)),
                ),
              )
            ]),
          ),
        ));
  }
}
