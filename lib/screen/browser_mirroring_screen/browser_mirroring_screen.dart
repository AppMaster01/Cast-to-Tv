// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, camel_case_types

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/media_qury/media_qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_settings/open_settings.dart';
import 'package:permission_handler/permission_handler.dart';

String CopyText = "http://192.168.1.9:8080";

class browser_mirroring_screen extends StatefulWidget {
  const browser_mirroring_screen({Key? key}) : super(key: key);

  @override
  State<browser_mirroring_screen> createState() =>
      _browser_mirroring_screenState();
}

class _browser_mirroring_screenState extends State<browser_mirroring_screen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/browser_mirroring_screen'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(
              context, '/browser_mirroring_screen');
        }, 'Cast To TV', true),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: ScreenSize.fSize_30()),
                    controllertexts.getext(
                        context,
                        '*Do not leave this page before connected',
                        GoogleFonts.poppins(
                            fontSize: ScreenSize.fSize_10(),
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF441E83))),
                    SizedBox(height: ScreenSize.fSize_34()),
                    Image(
                        height: ScreenSize.horizontalBlockSize! * 63,
                        image: const AssetImage(
                            'asset/image/browser-mirroring-vector.png')),
                    SizedBox(height: ScreenSize.fSize_30()),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: ScreenSize.fSize_28()),
                            Text("""1. Make sure your phone and cast device are
   connected to the same Wi-Fi. """,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: ScreenSize.fSize_14())),
                          ],
                        ),
                        SizedBox(height: ScreenSize.fSize_28()),
                        Row(
                          children: [
                            SizedBox(width: ScreenSize.fSize_28()),
                            Text(
                                """2. Open this website on the other device :""",
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: ScreenSize.fSize_14())),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_30()),
                    Row(
                      children: [
                        SizedBox(width: ScreenSize.fSize_45()),
                        Text(
                          'http://192.168.1.9:8080',
                          style: GoogleFonts.poppins(
                              fontSize: ScreenSize.fSize_16(),
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF5A3B8B)),
                        ),
                        SizedBox(width: ScreenSize.fSize_20()),
                        GestureDetector(
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: CopyText));

                            Fluttertoast.showToast(
                              msg: "Link copied",
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 3,
                              textColor: Colors.black,
                              gravity: ToastGravity.SNACKBAR,
                              backgroundColor: const Color(0xFFEADFFA),
                              fontSize: 15,
                            );
                          },
                          child: Image(
                              width: ScreenSize.fSize_23(),
                              image: const AssetImage(
                                  'asset/image/icon/copy-icon.png')),
                        )
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_30()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: ScreenSize.horizontalBlockSize! * 95,
                          height: ScreenSize.fSize_34(),
                          child: Text(
                            """The IP address may change every time you connect, so please make sure each number is entered correctly in the browser address bar.""",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                                fontSize:
                                    ScreenSize.horizontalBlockSize! * 2.7),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_30()),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: ScreenSize.horizontalBlockSize! * 140,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            'asset/image/icon/chromecast-icon.png')),
                                    SizedBox(height: ScreenSize.fSize_30()),
                                    Row(
                                      children: [
                                        SizedBox(width: ScreenSize.fSize_70()),
                                        Text(
                                          """Start recording or casting 
   with Screen Mirroring?""",
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500,
                                              fontSize: ScreenSize.fSize_18()),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: ScreenSize.fSize_30()),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width:
                                              ScreenSize.horizontalBlockSize! *
                                                  90,
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  30,
                                          // color: Colors.black12,
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: GoogleFonts.poppins(
                                                  color: Colors.black,
                                                  fontSize: ScreenSize
                                                          .horizontalBlockSize! *
                                                      3.5),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Screen Mirroring ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: ScreenSize
                                                                .horizontalBlockSize! *
                                                            3.5)),
                                                const TextSpan(
                                                    text:
                                                        """will have access to all of the information that is visible on your screen or played from your device while recording or casting. This includes information such as passwords, payment details, photos, messages and audio that you play."""),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: ScreenSize.fSize_30()),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              Navigator.of(context).pop(false),
                                          child: Container(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                12.5,
                                            width: ScreenSize
                                                    .horizontalBlockSize! *
                                                40,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFFB8B7B7),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      offset: Offset(0, 2),
                                                      color: Colors.black26,
                                                      blurRadius: 2)
                                                ]),
                                            child: Center(
                                                child: Text('Cancel',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: ScreenSize
                                                            .fSize_17()))),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            OpenSettings.openCastSetting();
                                          },
                                          child: Container(
                                            height: ScreenSize
                                                    .horizontalBlockSize! *
                                                12.5,
                                            width: ScreenSize
                                                    .horizontalBlockSize! *
                                                40,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF5A3B8B),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      offset: Offset(0, 2),
                                                      color: Colors.black26,
                                                      blurRadius: 2)
                                                ]),
                                            child: Center(
                                                child: Text('Start Now',
                                                    style: GoogleFonts.poppins(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: ScreenSize
                                                            .fSize_17()))),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        height: ScreenSize.horizontalBlockSize! * 14,
                        width: ScreenSize.horizontalBlockSize! * 60,
                        decoration: BoxDecoration(
                            color: const Color(0xFF5A3B8B),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 2),
                                  color: Colors.black26,
                                  blurRadius: 2)
                            ]),
                        child: Center(
                            child: Text('Start Mirroring',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: ScreenSize.fSize_18()))),
                      ),
                    ),
                    SizedBox(height: ScreenSize.fSize_80()),
                  ],
                ),
              ),
            ),
            banner.getBN('/browser_mirroring_screen')
          ],
        ),
      ),
    );
  }
}
