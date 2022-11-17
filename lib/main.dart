import 'package:flutter/material.dart';
import 'package:cicerone_project/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title : 'Cicerone',
    color: Colors.black,
    theme: ThemeData(
      backgroundColor: Colors.indigo.shade900,
    ),
    debugShowCheckedModeBanner: false,
    home: const RegisterPage(),
  );
  }
}
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cicerone'),
        backgroundColor: Colors.indigo.shade900,
        centerTitle: true,
      ),
       body: Padding (
       padding: const EdgeInsets.all(30.0),
       child: Column(
         children: [
           const Text('Register',
               style: TextStyle(
                   color: Colors.black87,
                   fontSize: 25,
                   fontWeight:FontWeight.bold)),
const Padding(
padding: EdgeInsets.all(10),
child: TextField(
decoration: InputDecoration(
  icon: Icon(Icons.person),
  labelText: 'Username',
  labelStyle: TextStyle(
    color: Colors.black12,
    fontSize: 12,
    fontWeight: FontWeight.normal)
),
  ),
),
const Padding(
padding: EdgeInsets.all(10),
child: TextField(
             decoration: InputDecoration(
               icon: Icon(Icons.source_outlined),
               labelText: 'Source',
               labelStyle: TextStyle(
                   color: Colors.black12,
                   fontSize: 12,
                   fontWeight: FontWeight.normal),
             ),
           ),
),
const Padding(
padding: EdgeInsets.all(10),
child:TextField(
             decoration: InputDecoration(
               icon: Icon(Icons.input),
               labelText: 'Destination',
               labelStyle: TextStyle(
                   color: Colors.black12,
                   fontSize: 12,
                   fontWeight: FontWeight.normal),
             ),
           ),
           ),
          
         ])
      ),
    );
  }
}
