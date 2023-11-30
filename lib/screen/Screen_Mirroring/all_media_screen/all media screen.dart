// ignore_for_file: camel_case_types

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/media_qury/media_qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:cast_tv/screen/Screen_Mirroring/all_media_screen/audio_Player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller_Page/Google_Ads.dart';

class all_media_screen extends StatelessWidget {
  const all_media_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/all_media_screen'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/all_media_screen');
        }, 'Cast To TV', true),
        body: Stack(
          children: [
            Center(
                child: Column(
              children: [
                SizedBox(height: ScreenSize.fSize_40()),
                Image(
                    width: ScreenSize.horizontalBlockSize! * 65,
                    image: const AssetImage('asset/image/media-vector.png')),
                SizedBox(height: ScreenSize.fSize_50()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    controllercontain.getcontain(context, () {
                      controller.showbuttonad(
                          context, '/Video_Player', '/all_media_screen', 'arg');
                    }, 'All videos', 'asset/image/icon/video-player-icon.png'),
                    controllercontain.getcontain(context, () {
                      controller.showbuttonad(
                          context, '/image', '/all_media_screen', 'arg');
                    }, 'Images', 'asset/image/icon/image-gallery 2.png'),
                  ],
                ),
                SizedBox(height: ScreenSize.fSize_20()),
                controllercontain.getcontain(context, () {
                  Get.to(() => const Audio_Player());

                  //   controller.showbuttonad(context, '/Audio_Player', '/all_media_screen', '');
                }, 'Audio', 'asset/image/icon/audio-icon.png'),
              ],
            )),
            banner.getBN('/all_media_screen'),
          ],
        ),
      ),
    );
  }
}
