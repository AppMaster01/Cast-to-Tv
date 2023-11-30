// ignore_for_file: sized_box_for_whitespace, camel_case_types

import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/screen/Whatsapp_direct_screen/Whatsapp_direct_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_settings/open_settings.dart';

import 'Controller_Page/Button_controller/Main_Controller.dart';
import 'Controller_Page/My_Controller.dart';
import 'Media_Qury/Media_Qury.dart';
import 'Widget_controllers/controller.dart';

MyAppController myAppController = Get.put(MyAppController());

class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
    return exitResult ?? false;
  }

  Scaffold _buildExitDialog(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AlertDialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 3,
            content: Container(
              height: ScreenSize.fSize_120(),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          """Do you want to exit 
            this app?""",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenSize.fSize_18()),
                        ),
                        SizedBox(height: ScreenSize.fSize_10()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: ScreenSize.fSize_40(),
                  width: ScreenSize.fSize_100(),
                  decoration: const BoxDecoration(
                      color: Color(0xFFE0CDFF),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 4),
                            color: Colors.black26,
                            blurRadius: 2)
                      ]),
                  child: Center(
                      child: Text(
                    "Exit",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenSize.fSize_18()),
                  )),
                ),
                SizedBox(height: ScreenSize.fSize_120()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: ScreenSize.fSize_15()),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: Container(
                        width: ScreenSize.fSize_130(),
                        height: ScreenSize.horizontalBlockSize! * 12,
                        decoration: BoxDecoration(
                            color: const Color(0xFFCAA9FF),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  color: Colors.black26,
                                  blurRadius: 2)
                            ]),
                        child: Center(
                          child: Text(
                            'No',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenSize.fSize_18()),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => SystemNavigator.pop(),
                      child: Container(
                        width: ScreenSize.fSize_130(),
                        height: ScreenSize.horizontalBlockSize! * 12,
                        decoration: BoxDecoration(
                            color: const Color(0xFF5A3B8B),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  color: Colors.black26,
                                  blurRadius: 2)
                            ]),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenSize.fSize_18()),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: ScreenSize.fSize_10()),
                  ],
                ),
              ],
            ),
          ),
          // Positioned(
          //   left: ScreenSize.horizontalBlockSize! * 18,
          //   top: ScreenSize.horizontalBlockSize! * 122,
          //   child:
          // ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          )),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () {
                  OpenSettings.openCastSetting();
                },
                child: Image(
                    height: ScreenSize.fSize_23(),
                    image: const AssetImage('asset/image/icon/cast-icon.png')),
              ),
            ),
            SizedBox(width: ScreenSize.fSize_15()),
          ],
          elevation: 0,
          backgroundColor: const Color(0xFF5A3B8B),
          centerTitle: true,
          title: Text('Cast To TV',
              style: GoogleFonts.poppins(
                  fontSize: ScreenSize.fSize_20(),
                  fontWeight: FontWeight.w500,
                  color: Colors.white)),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                  child: Column(children: [
                SizedBox(height: ScreenSize.fSize_30()),
                SizedBox(
                  height: ScreenSize.horizontalBlockSize! * 15,
                  width: ScreenSize.horizontalBlockSize! * 80,
                  child: Text(
                    textAlign: TextAlign.center,
                    """Please make sure that your phone and Tv are connected to the same Wifi Network.""",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenSize.fSize_12()),
                  ),
                ),
                SizedBox(height: ScreenSize.fSize_20()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(width: ScreenSize.fSize_15()),
                    controllercontain.getcontain(context, () {
                      controller.showbuttonad(
                          context, '/How_to_use1', '/Home_page', '');
                    }, 'Screen Mirroring',
                        'asset/image/icon/screen-mirroring-icon.png'),
                    // SizedBox(width: ScreenSize.fSize_15()),
                    controllercontain.getcontain(context, () {
                      controller.showbuttonad(context,
                          '/browser_mirroring_screen', '/Home_page', '');
                    }, 'Browser Mirroring',
                        'asset/image/icon/browser-mirroring-icon.png')
                  ],
                ),
                SizedBox(height: ScreenSize.fSize_18()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(width: ScreenSize.fSize_15()),
                    controllercontain.getcontain(context, () {
                      controller.showbuttonad(
                          context, '/remote_control_screen', '/Home_page', '');
                    }, 'Remote Control',
                        'asset/image/icon/remote-control-icon.png'),
                    // SizedBox(width: ScreenSize.fSize_15()),
                    controllercontain.getcontain(context, () {
                      controller.showbuttonad(
                          context, '/page', '/Home_page', '');
                    }, 'Video Player', 'asset/image/icon/video-player-icon.png')
                  ],
                ),
                SizedBox(height: ScreenSize.fSize_18()),
                controllercontain.getcontain(context, () {
                  Whatsapp_direct_screenState().code.clear();
                  Whatsapp_direct_screenState().number.clear();
                  Whatsapp_direct_screenState().massage.clear();
                  controller.showbuttonad(
                      context, '/Whatsapp_direct_screen', '/Home_page', '');
                }, 'WhatsApp Direct',
                    'asset/image/icon/whatsapp-direct-icon.png'),

              ])),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: native.getNT("/Home_page", 'listTile'),
            ),
            //
          ],
        ),
      ),
    );
  }
}
