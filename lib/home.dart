import 'package:flutter/material.dart';
import 'package:sounds/sound_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Audio"),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SoundWidget("Sample 1", 0),
            SoundWidget("Sample 2", 1),
            SoundWidget("Sample 3", 2),
            SoundWidget("Sample 4", 3),
            SoundWidget("Sample 5", 4),
          ],
        ));
  }
}
