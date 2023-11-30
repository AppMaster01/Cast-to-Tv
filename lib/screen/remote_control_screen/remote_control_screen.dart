// ignore_for_file: camel_case_types

import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/media_qury/media_qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';

import '../../Controller_Page/Button_controller/Back_Butoon_controller.dart';

class remote_control_screen extends StatelessWidget {
  const remote_control_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/remote_control_screen'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(
              context, '/remote_control_screen');
        }, 'Cast To TV', true),
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_50()),
                  Image(
                      height: ScreenSize.horizontalBlockSize! * 55,
                      image: const AssetImage('asset/image/cast-to-tv-vector.png')),
                  SizedBox(height: ScreenSize.fSize_40()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      controllercontain.getcontain(context, () {
                        controller.showbuttonad(
                          context,
                          '/choose_tv_brand_screen',
                          '/remote_control_screen','',
                        );
                      }, 'Add Remote', 'asset/image/icon/add-remote-icon.png'),
                      controllercontain.getcontain(context, () {
                        controller.showbuttonad(context, '/saved_remote_screen',
                            '/remote_control_screen','');
                      }, 'Saved Remote',
                          'asset/image/icon/saved-remote-icon.png'),
                    ],
                  )
                ],
              ),
            ),
            banner.getBN('/remote_control_screen')
          ],
        ),
      ),
    );
  }
}
