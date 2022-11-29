import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cicerone_project/firebase_options.dart';
import 'home.dart';

// ignore: camel_case_types
 class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);
  @override
  State<loginScreen> createState() => _loginScreenState();
}
class _loginScreenState extends State<loginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var obscureText = true;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cicerone'),
          backgroundColor: Colors.green.shade700,
        ),
        body: Center(
          child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(children: [
            const Text('Login to Navigate',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                icon: Icon(Icons.email,
                color: Colors.black12,
                ),
                labelText: 'Email id',
                labelStyle: TextStyle(
                    color: Colors.black12,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                icon: const Icon(
                  Icons.lock,
                  color: Colors.black12,
                ),
                suffixIcon:  GestureDetector(
                  onTap: () {
                    setState(() {
                       obscureText = !obscureText;
                    });
                  },
                  child: obscureText  
                  ? const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                    )
                    : Icon(
                      Icons.visibility,
                      color: Colors.black12,
                 )),
                labelText: 'Password',
                labelStyle: const TextStyle(
                    color: Colors.black12,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
                
                 padding: const EdgeInsets.all(8.0),
                 child: ElevatedButton(
                  child: const Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green.shade700,
                    onPrimary: Colors.white,
            
                  ),
                  onPressed: () async {
                    await Firebase.initializeApp(
                      options: DefaultFirebaseOptions.currentPlatform,
                    );
                    final email = _email.text;
                    final password = _password.text;
                    final userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                    //print(userCredential);
                  },
                )),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Don\'t have an account? Sign up now.',
                 style: TextStyle(color: Color(0Xff4fbf26)),),
                 )
          ]),
          ),
        ));
  }
}
