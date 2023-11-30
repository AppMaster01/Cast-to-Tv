// ignore_for_file: camel_case_types

import 'dart:io';
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/media_qury/media_qury.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Audio_Player extends StatefulWidget {
  const Audio_Player({Key? key}) : super(key: key);

  @override
  State<Audio_Player> createState() => _Audio_PlayerState();
}

class _Audio_PlayerState extends State<Audio_Player> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    setAudio();
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    // String url = 'https://soundcloud.com/iamhardstyle/brennan-heart-tony-junior-whats-up?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing';
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);
      audioPlayer.setSourceUrl(file.path);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    audioPlayer.dispose();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdde0f0),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        )),
        leading: GestureDetector(
            onTap: () {
              backbuttoncontroller.showBackbuttonad(context, '/Audio_Player');
            },
            child: Center(
                child: Image(
              height: ScreenSize.fSize_20(),
              image: const AssetImage('asset/image/icon/back-icon.png'),
            ))),
        elevation: 0,
        backgroundColor: const Color(0xFF5A3B8B),
        title: Text('Audio',
            style: GoogleFonts.nunito(
                fontSize: ScreenSize.horizontalBlockSize! * 5,
                fontWeight: FontWeight.w600)),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-vector/blurred-background-with-light-colors_1034-245.jpg?w=2000'),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: const AssetImage('asset/image/icon/itunes.png'),
                    height: ScreenSize.fSize_150(),
                  ),
                  SizedBox(height: ScreenSize.fSize_100()),
                  Text(
                    audioPlayer.playerId,
                    style: GoogleFonts.originalSurfer(),
                  ),
                  SizedBox(height: ScreenSize.fSize_30()),
                  Slider(
                    activeColor: const Color(0xff5A3B8B),
                    inactiveColor: const Color(0xff5A3B8B),
                    thumbColor: const Color(0xff5A3B8B),
                    min: 0,
                    max: duration.inSeconds.toDouble(),
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: ScreenSize.fSize_16()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(formatTime(position)),
                        Text(formatTime(duration - position)),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: const Color(0xff5A3B8B),
                    radius: ScreenSize.fSize_34(),
                    child: IconButton(
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      iconSize: 50,
                      color: Colors.white,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          // String url =
                          //     'https://soundcloud.com/iamhardstyle/brennan-heart-tony-junior-whats-up?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing';
                          await audioPlayer.resume();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
