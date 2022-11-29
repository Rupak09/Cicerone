import 'package:cicerone_project/loginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
    title: 'Cicerone',
    home: SignupPage(),
    debugShowCheckedModeBanner: false,
    
  ));
}
