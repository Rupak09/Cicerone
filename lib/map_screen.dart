import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:cicerone_project/dijkstra.dart';

class Mappage extends StatelessWidget {
  Mappage({super.key, required this.from, required this.to});

  int from;
  int to;
  StateMachineController? controller;
  SMIInput<bool>? te;
  SMIInput<bool>? ea;
  SMIInput<bool>? am;
  SMIInput<bool>? tm;
  SMIInput<bool>? tes;
  SMIInput<bool>? esm;

  void set() {
    List ls = fun(from, to);
    for (int i = 0; i < ls.length; i++) {
      if (ls[i] == 12 || ls[i] == 21) {
        te?.change(true);
      } else if (ls[i] == 23 || ls[i] == 32) {
        ea?.change(true);
      } else if (ls[i] == 35 || ls[i] == 53) {
        am?.change(true);
      } else if (ls[i] == 15 || ls[i] == 51) {
        tm?.change(true);
      } else if (ls[i] == 14 || ls[i] == 41) {
        tes?.change(true);
      } else if (ls[i] == 45 || ls[i] == 54) {
        esm?.change(true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Museum Map Navigation'),
          backgroundColor: Colors.green.shade700,),
        body: Center(
          child: RiveAnimation.asset(
            'assets/map.riv',
            stateMachines: const ["Map"],
            onInit: (artboard) {
              controller =
                  StateMachineController.fromArtboard(artboard, "MAP-PLAY");
              if (controller == null) return;
              artboard.addController(controller!);
              te = controller?.findInput('te');
              ea = controller?.findInput('ea');
              am = controller?.findInput('am');
              tm = controller?.findInput('tm');
              tes = controller?.findInput('tes');
              esm = controller?.findInput('esm');
              set();
            },
          ),
        ));
  }
}
