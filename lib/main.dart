import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  Future<void> playMusic() async {
    // await audioPlayer.play('assets/antarctic-wind_091523.mp3');//古い
    await audioPlayer.play(AssetSource('antarctic-wind_091523.mp3'));//新
  }

  Future<void> pauseMusic() async {
    await audioPlayer.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("音楽再生Switch"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("涼しげBGM"),
            Switch(
              value: isPlaying,
              onChanged: (value) {
                setState(() {
                  isPlaying = value;
                });
                if (isPlaying) {
                  playMusic();
                } else {
                  pauseMusic();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
