import 'package:cicerone_project/main.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/main.dart';
 class loginScreen extends StatefulWidget {
  const loginScreen({super.key});
  @override
  State<loginScreen> createState() => _loginScreenState();
}
class _loginScreenState extends State<loginScreen> {
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
           const Text('Login',
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
FloatingActionButton(onPressed: () {Navigator.pop(context, MaterialPageRoute(builder: (context) => const MyApp(), 
),
);
},
backgroundColor: Colors.indigo.shade900,
child: const Text('Login'),
)
],),
),
    );
  } 
}