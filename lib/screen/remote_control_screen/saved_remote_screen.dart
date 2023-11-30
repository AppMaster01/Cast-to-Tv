// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:cast_tv/screen/remote_control_screen/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller_Page/Button_controller/Back_Butoon_controller.dart';
import '../../Media_Qury/Media_Qury.dart';

class saved_remote_screen extends StatelessWidget {
  const saved_remote_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/saved_remote_screen'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(
              context, '/saved_remote_screen');
        }, 'TV Remote Control', true),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(ScreenSize.fSize_20()),
              child: Container(
                child: ListView.builder(
                    itemCount: remoteController.itemcount.value,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          controller.showbuttonad(
                              context,
                              '/TV_remote_screen',
                              '/saved_remote_screen',
                              remoteController.acname.value[index].name);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(ScreenSize.fSize_10()),
                          child: Container(
                            height: ScreenSize.horizontalBlockSize! * 14,
                            width: ScreenSize.horizontalBlockSize! * 83,
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
                                        'asset/image/icon/remote-control-icon.png')),
                                Text(
                                  remoteController.acname.value[index].name,
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          ScreenSize.horizontalBlockSize! * 5),
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
                      );
                    }),
              ),
            ),
            banner.getBN('/saved_remote_screen')
          ],
        ),
      ),
    );
  }
}
