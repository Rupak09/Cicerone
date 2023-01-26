import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SampleMap extends StatelessWidget {
  SampleMap({super.key});

  StateMachineController? controller;
  SMIInput<bool>? te;
  SMIInput<bool>? ea;
  SMIInput<bool>? am;
  SMIInput<bool>? tm;
  SMIInput<bool>? tes;
  SMIInput<bool>? esm;

  void set() {
    te?.change(false);
    ea?.change(false);
    am?.change(false);
    tm?.change(false);
    tes?.change(false);
    esm?.change(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Museum Map View'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Center(
        child: Center(
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
        ),
      ),
    );
  }
}
