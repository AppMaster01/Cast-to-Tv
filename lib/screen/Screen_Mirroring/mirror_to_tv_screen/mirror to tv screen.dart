// ignore_for_file: camel_case_types


import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_settings/open_settings.dart';

import '../../../Controller_Page/Google_Ads.dart';
import '../../../media_qury/media_qury.dart';

class mirror_to_tv_screen extends StatelessWidget {
  const mirror_to_tv_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/mirror_to_tv_screen'),
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          )),
          leading: GestureDetector(
              onTap: () {
                backbuttoncontroller.showBackbuttonad(
                    context, '/mirror_to_tv_screen');
              },
              child: Center(
                  child: Image(
                height: ScreenSize.fSize_20(),
                image: const AssetImage('asset/image/icon/back-icon.png'),
              ))),
          elevation: 0,
          backgroundColor: const Color(0xFF5A3B8B),
          centerTitle: true,
          title: Text('Cast To TV',
              style: GoogleFonts.nunito(
                  fontSize: ScreenSize.horizontalBlockSize! * 5.2,
                  fontWeight: FontWeight.w600)),
          actions: [
            Center(
                child: GestureDetector(
              onTap: () {
                controller.showbuttonad(
                    context, '/Help', '/mirror_to_tv_screen','');
              },
              child: Image(
                  height: ScreenSize.fSize_23(),
                  image: const AssetImage('asset/image/icon/info.png')),
            )),
            SizedBox(width: ScreenSize.fSize_13()),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_20()),
                    GestureDetector(
                      onTap: () {
                        OpenSettings.openCastSetting();
                      },
                      child: Container(
                        height: ScreenSize.horizontalBlockSize! * 15,
                        width: ScreenSize.horizontalBlockSize! * 94.5,
                        decoration: BoxDecoration(
                            color: const Color(0xFFF9F5FF),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black26,
                                  blurRadius: 2)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image(
                                width: ScreenSize.fSize_30(),
                                image: const AssetImage(
                                    'asset/image/icon/smart-tv-icon.png')),
                            Text(
                              'Mirror To TV',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      ScreenSize.horizontalBlockSize! * 5.5),
                            ),

                            Image(
                                width: ScreenSize.fSize_23(),
                                image: const AssetImage(
                                    'asset/image/icon/arrowright2.png')),
                            // SizedBox(width: ScreenSize.fSize_3()),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_10()),
                    // native.getNT('/mirror_to_tv_screen', 'listTileMedium'),
                    SizedBox(height: ScreenSize.fSize_10()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controllercontain.getcontain(context, () {
                          controller.showbuttonad(context,
                              '/remote_control_screen', '/mirror_to_tv_screen','');
                        }, 'Remote Control',
                            'asset/image/icon/remote-control-icon.png'),
                        controllercontain.getcontain(context, () {
                          controller.showbuttonad(
                              context,
                              '/browser_mirroring_screen',
                              '/mirror_to_tv_screen','');
                        }, 'Browser Mirroring',
                            'asset/image/icon/browser-mirroring-icon.png'),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_20()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        controllercontain.getcontain(context, () {
                          controller.showbuttonad(
                              context, '/Video_Player', '/mirror_to_tv_screen','');
                        }, 'Video Player',
                            'asset/image/icon/video-player-icon.png'),
                        controllercontain.getcontain(context, () {
                          controller.showbuttonad(
                              context,
                              '/Whatsapp_direct_screen',
                              '/mirror_to_tv_screen','');
                        }, 'WhatsApp Direct',
                            'asset/image/icon/whatsapp-direct-icon.png'),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_80()),
                  ],
                ),
              ),
            ),
            banner.getBN('/mirror_to_tv_screen')
          ],
        ),
      ),
    );
  }
}
