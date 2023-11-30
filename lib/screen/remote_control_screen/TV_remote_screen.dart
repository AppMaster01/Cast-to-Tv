// ignore_for_file: camel_case_types

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/Media_Qury/Media_Qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

int index = 0;

class TV_remote_screen extends StatefulWidget {
  const TV_remote_screen({Key? key}) : super(key: key);

  @override
  State<TV_remote_screen> createState() => _TV_remote_screenState();
}

class _TV_remote_screenState extends State<TV_remote_screen> {
  var abc = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/TV_remote_screen'),
      child: Scaffold(
        backgroundColor: const Color(0xFFEADFFA),
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/TV_remote_screen');
        }, abc.toString(), true),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    contollercircle.getcircle(
                        context, ScreenSize.fSize_50(), ScreenSize.fSize_50(),
                        () {
                      Colors.amber;
                    }, 'asset/image/icon/start-icon.png'),
                    contollercircle.getcircle(
                        context,
                        ScreenSize.fSize_50(),
                        ScreenSize.fSize_50(),
                        () {},
                        'asset/image/icon/volumecross.png'),
                    contollercircle.getcircle(
                        context,
                        ScreenSize.fSize_50(),
                        ScreenSize.fSize_50(),
                        () {},
                        'asset/image/icon/textalignjustifycenter.png'),
                  ],
                ),
                SizedBox(
                  height: ScreenSize.fSize_80(),
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: ScreenSize.fSize_180(),
                        height: ScreenSize.fSize_180(),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEADFFA),
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white,
                              width: ScreenSize.horizontalBlockSize! * 13.5),
                        ),
                        child: Center(
                            child: Text(
                          'ok',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenSize.fSize_18()),
                        )),
                      ),
                    ),
                    Container(
                      width: ScreenSize.fSize_180(),
                      height: ScreenSize.fSize_180(),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                              child: Image(
                                  width: ScreenSize.fSize_28(),
                                  image: const AssetImage(
                                      'asset/image/icon/arrowup.png'))),
                          SizedBox(height: ScreenSize.fSize_60()),
                          Center(
                              child: Image(
                                  width: ScreenSize.fSize_28(),
                                  image: const AssetImage(
                                      'asset/image/icon/arrowdown.png'))),
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenSize.fSize_180(),
                      height: ScreenSize.fSize_180(),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Center(
                              child: Image(
                                  width: ScreenSize.fSize_28(),
                                  image: const AssetImage(
                                      'asset/image/icon/arrowleft.png'))),
                          SizedBox(width: ScreenSize.fSize_60()),
                          Center(
                              child: Image(
                                  width: ScreenSize.fSize_28(),
                                  image: const AssetImage(
                                      'asset/image/icon/arrowright.png'))),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenSize.fSize_30(),
                ),
                Container(
                  height: ScreenSize.fSize_40(),
                  width: ScreenSize.fSize_40(),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Center(
                      child: Image(
                          height: ScreenSize.fSize_20(),
                          image: const AssetImage(
                              'asset/image/icon/dial-pad-icon.png'))),
                ),
                SizedBox(
                  height: ScreenSize.fSize_30(),
                ),
                Container(
                  width: ScreenSize.fSize_190(),
                  height: ScreenSize.fSize_50(),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                            child: Image(
                                height: ScreenSize.horizontalBlockSize! * 7,
                                image: const AssetImage(
                                    'asset/image/icon/CH-icon.png'))),
                        controllertexts.getext(
                            context,
                            'CH',
                            GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenSize.fSize_15())),
                        Center(
                            child: Image(
                                height: ScreenSize.horizontalBlockSize! * 7,
                                image: const AssetImage(
                                    'asset/image/icon/CH+icon.png'))),
                      ]),
                ),
                SizedBox(
                  height: ScreenSize.fSize_30(),
                ),
                Container(
                  width: ScreenSize.fSize_190(),
                  height: ScreenSize.fSize_50(),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                            child: Image(
                                height: ScreenSize.horizontalBlockSize! * 7,
                                image: const AssetImage(
                                    'asset/image/icon/volumelow.png'))),
                        controllertexts.getext(
                            context,
                            'VOL',
                            GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenSize.fSize_15())),
                        Center(
                            child: Image(
                                height: ScreenSize.horizontalBlockSize! * 7,
                                image: const AssetImage(
                                    'asset/image/icon/volumeup.png'))),
                      ]),
                ),
              ],
            ),
            banner.getBN('/TV_remote_screen')
          ],
        ),
      ),
    );
  }
}
