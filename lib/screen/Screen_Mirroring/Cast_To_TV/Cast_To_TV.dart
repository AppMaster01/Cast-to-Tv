import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/media_qury/media_qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Cast_To_TV extends StatefulWidget {
  const Cast_To_TV({Key? key}) : super(key: key);

  @override
  State<Cast_To_TV> createState() => _Cast_To_TVState();
}

// ignore: camel_case_types
class _Cast_To_TVState extends State<Cast_To_TV> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Cast_To_TV'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/Cast_To_TV');
        }, 'Cast To TV', true),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_70()),
                  Center(
                      child: Image(
                          height: ScreenSize.fSize_180(),
                          image:
                              const AssetImage('asset/image/cast-to-tv-vector.png'))),
                  SizedBox(height: ScreenSize.fSize_50()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controllercontain.getcontain(context, () {
                        controller.showbuttonad(
                            context, '/select_tv', '/Cast_To_TV','');
                      }, 'Select TV Model',
                          'asset/image/icon/screen-mirroring-icon.png'),
                      controllercontain.getcontain(context, () {
                        controller.showbuttonad(
                            context, '/all_media_screen', '/Cast_To_TV','');
                      }, 'All Media', 'asset/image/icon/video-player-icon.png'),
                    ],
                  )
                ],
              ),
            ),
            banner.getBN('/Cast_To_TV')
          ],
        ),
      ),
    );
  }
}
