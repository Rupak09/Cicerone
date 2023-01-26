import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            SizedBox(
              height: 200,
              width: 400,
              child: Image.asset('assets/logo.png'),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.center,
              child: const Text(
                "E-Navigation",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.center,
              child: const Text(
                "Team Members",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.center,
              child: const Text(
                "Krishna Koushik",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.center,
              child: const Text(
                "Rupak Babu",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.center,
              child: const Text(
                "Sri Harsha",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.center,
              child: const Text(
                "Reethu Joycey",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 20),
              alignment: Alignment.center,
              child: const Text(
                "Rithika",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ])),
    );
  }
}
