import 'package:cicerone_project/loginScreen.dart';
import 'package:cicerone_project/show_error_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          const Text("We've sent you an email verification."),
          const SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: () {
                final user = FirebaseAuth.instance.currentUser;
                if (user?.emailVerified ?? false) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                } else {
                  showErrorDialog(context, 'Please verify your email');
                }
              },
              child: const Text('Verified!')),
          const SizedBox(
            height: 10,
          ),
          const Text(
              "      If you haven't received verification mail yet, You can request again below"),
          const SizedBox(
          
            height: 10,
          ),
          TextButton(
            
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text('Send Email Verification'),
          ),
        ],
      ),
    );
  }
}
