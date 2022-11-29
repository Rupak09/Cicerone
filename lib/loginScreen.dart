import 'package:cicerone_project/home.dart';
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
  late final TextEditingController _Username;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _Username = TextEditingController();
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _Username.dispose();
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
            const Text('Register Here!',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    
                    fontWeight: FontWeight.bold)),
          
           TextField(
              controller: _Username,
              decoration: InputDecoration(
                  icon: Icon(Icons.person,color: Colors.black12,),
                  labelText: 'Username',
                  labelStyle: TextStyle(
                      color: Colors.black12,
                      fontSize: 12,
                      fontWeight: FontWeight.normal)),
            ),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                icon: Icon(Icons.email,color: Colors.black12,),
                labelText: 'Email Id',
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
              decoration: InputDecoration(
                icon: Icon(
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
                    :const Icon(
                      Icons.visibility,
                      color: Colors.black12,
                 )),
                labelText: 'Password',
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
                    :const Icon(
                      Icons.visibility,
                      color: Colors.black12,
                 )),
                labelText: 'Confirm Password',
                labelStyle: TextStyle(
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
                    final username = _Username.text;
                    final email = _email.text;
                    final password = _password.text;
                    final userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: email, password: password)
                        .then((value) {
                      print("Created new account");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                )),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const loginScreen()));
                },
                child: const Text('Already a user? Log in!',
                style: TextStyle(color: Color(0Xff4fbf26)),),
        )]),
          ),
        ));
  }
}
