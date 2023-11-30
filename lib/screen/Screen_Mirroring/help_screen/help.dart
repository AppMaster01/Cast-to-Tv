// ignore_for_file: avoid_unnecessary_containers

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller_Page/Google_Ads.dart';
import '../../../Media_Qury/Media_Qury.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(context, '/Help'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/Help');
        }, 'Help', true),
        body: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    native.getNT('/Help', "listTile"),
                    SizedBox(height: ScreenSize.fSize_30()),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: const Color(0xffF9F5FF),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(ScreenSize.fSize_20()),
                              topLeft: Radius.circular(ScreenSize.fSize_20()))),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_10()),
                            child: Center(
                              child: Image(
                                image: const AssetImage(
                                    "asset/image/Image/info-image1.png"),
                                height: ScreenSize.fSize_120(),
                                color: const Color(0xffCAA9FF),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          Text(
                            "Connect the phone and TV to the same WIFI network",
                            style: GoogleFonts.georama(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_8()),
                            child: Divider(
                              height: ScreenSize.fSize_10(),
                              color: const Color(0xFF5A3B8B),
                              thickness: ScreenSize.fSize_2(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_10()),
                            child: Image(
                              image: const AssetImage(
                                  "asset/image/Image/info-image2.png"),
                              height: ScreenSize.fSize_120(),
                              color: const Color(0xffCAA9FF),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          Text(
                            "Enable miracast display on your TV",
                            style: GoogleFonts.georama(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_8()),
                            child: Divider(
                              height: ScreenSize.fSize_10(),
                              color: const Color(0xFF5A3B8B),
                              thickness: ScreenSize.fSize_2(),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(ScreenSize.fSize_10()),
                            child: Image(
                              image: const AssetImage(
                                  "asset/image/Image/info-image3.png"),
                              height: ScreenSize.fSize_120(),
                              color: const Color(0xffCAA9FF),
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_10()),
                          Text(
                            textAlign: TextAlign.center,
                            """Click on NEXT button, for enable Wireless
Display & choose your TV""",
                            style: GoogleFonts.georama(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: ScreenSize.fSize_80()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            banner.getBN('/Help')
          ],
        ),
      ),
    );
  }
}
