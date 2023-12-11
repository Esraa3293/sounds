import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class SoundWidget extends StatefulWidget {
  String text;
  int index;

  SoundWidget(this.text, this.index, {super.key});

  @override
  State<SoundWidget> createState() => _SoundWidgetState();
}

class _SoundWidgetState extends State<SoundWidget> {
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    assetsAudioPlayer.open(
      Playlist(audios: [
        Audio('assets/sounds/sample1.mp3'),
        Audio('assets/sounds/sample2.mp3'),
        Audio('assets/sounds/sample3.mp3'),
        Audio('assets/sounds/sample4.mp3'),
        Audio('assets/sounds/sample5.mp3'),
      ]),
      autoStart: false,
      loopMode: LoopMode.single,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        tileColor: Colors.grey.shade200,
        title: Text(widget.text),
        trailing: IconButton(
            onPressed: () {
              if (assetsAudioPlayer.isPlaying.value) {
                assetsAudioPlayer.pause();
              } else {
                assetsAudioPlayer.playlistPlayAtIndex(widget.index);
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            icon: isPlaying
                ? const Icon(Icons.pause)
                : const Icon(Icons.play_arrow)),
      ),
    );
  }
}
