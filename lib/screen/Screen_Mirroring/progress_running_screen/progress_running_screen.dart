import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/media_qury/media_qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';

// ignore: camel_case_types
class progress_running_screen extends StatefulWidget {
  const progress_running_screen({Key? key}) : super(key: key);

  @override
  State<progress_running_screen> createState() =>
      _progress_running_screenState();
}

// ignore: camel_case_types
class _progress_running_screenState extends State<progress_running_screen>
    with TickerProviderStateMixin {
  late AnimationController scaleController =
      AnimationController(duration: const Duration(seconds: 0), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController =
      AnimationController(duration: const Duration(seconds: 1), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.elasticIn);

//================================================================================================================
  late AnimationController scaleController1 =
      AnimationController(duration: const Duration(seconds: 0), vsync: this);
  late Animation<double> scaleAnimation1 =
      CurvedAnimation(parent: scaleController1, curve: Curves.elasticOut);
  late AnimationController checkController1 =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late Animation<double> checkAnimation1 =
      CurvedAnimation(parent: checkController1, curve: Curves.elasticIn);

//================================================================================================================
  late AnimationController scaleController2 =
      AnimationController(duration: const Duration(seconds: 0), vsync: this);
  late Animation<double> scaleAnimation2 =
      CurvedAnimation(parent: scaleController2, curve: Curves.elasticOut);
  late AnimationController checkController2 =
      AnimationController(duration: const Duration(seconds: 3), vsync: this);
  late Animation<double> checkAnimation2 =
      CurvedAnimation(parent: checkController2, curve: Curves.elasticIn);

//================================================================================================================
  late AnimationController scaleController3 =
      AnimationController(duration: const Duration(seconds: 0), vsync: this);
  late Animation<double> scaleAnimation3 =
      CurvedAnimation(parent: scaleController3, curve: Curves.elasticOut);
  late AnimationController checkController3 =
      AnimationController(duration: const Duration(seconds: 4), vsync: this);
  late Animation<double> checkAnimation3 =
      CurvedAnimation(parent: checkController3, curve: Curves.elasticIn);

  //================================================================================================================
  late AnimationController nextscaleController =
      AnimationController(duration: const Duration(seconds: 5), vsync: this);
  late Animation<double> nextscaleAnimation =
      CurvedAnimation(parent: nextscaleController, curve: Curves.elasticOut);
  late AnimationController nextcheckController =
      AnimationController(duration: const Duration(seconds: 5), vsync: this);
  late Animation<double> nextcheckAnimation =
      CurvedAnimation(parent: nextcheckController, curve: Curves.elasticOut);

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController1.forward();
      }
    });
    scaleController2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController2.forward();
      }
    });
    scaleController3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController3.forward();
      }
    });
    nextscaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        nextcheckController.forward();
      }
    });

    scaleController.forward();
    scaleController1.forward();
    scaleController2.forward();
    scaleController3.forward();
    nextscaleController.forward();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(() {
          timer = true;
        });
      },
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          color1 = true;
        });
      },
    );
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          color2 = true;
        });
      },
    );
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          color3 = true;
        });
      },
    );
    Future.delayed(
      const Duration(seconds: 4),
      () {
        setState(() {
          color4 = true;
        });
      },
    );
  }

  bool timer = false;
  bool color1 = false;
  bool color2 = false;
  bool color3 = false;
  bool color4 = false;

  button() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Progress Running',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenSize.fSize_23())),
            JumpingDotsProgressIndicator(
              fontSize: ScreenSize.fSize_30(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Please Wait',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: ScreenSize.fSize_15())),
            JumpingDotsProgressIndicator(
              fontSize: ScreenSize.fSize_15(),
            ),
          ],
        ),
      ],
    );
  }

  colors1(String name) {
    return Text(name,
        style: GoogleFonts.georama(
            color: Colors.black, fontWeight: FontWeight.w500));
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    scaleController1.dispose();
    checkController1.dispose();
    scaleController2.dispose();
    checkController2.dispose();
    scaleController3.dispose();
    checkController3.dispose();
    nextscaleController.dispose();
    nextcheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    double circleSize = ScreenSize.fSize_18();
    double iconSize = ScreenSize.fSize_14();
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/progress_running_screen'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(
              context, '/progress_running_screen');
        }, 'Cast To TV', true),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(children: [
                  SizedBox(height: ScreenSize.fSize_30()),
                  Image(
                      height: ScreenSize.horizontalBlockSize! * 50,
                      image: const AssetImage(
                          'asset/image/Progress running illustration.png')),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Column(
                    children: [
                      Center(
                        child: ScaleTransition(
                          scale: nextcheckAnimation,
                          child: Text('Progress Complete',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: ScreenSize.fSize_23())),
                        ),
                      ),
                      if (timer == true) ...[
                        Container()
                      ] else ...[
                        button(),
                      ],
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_50()),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_40()),
                      Stack(
                        children: [
                          Center(
                            child: ScaleTransition(
                              scale: scaleAnimation,
                              child: Container(
                                height: circleSize,
                                width: circleSize,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          SizeTransition(
                            sizeFactor: checkAnimation,
                            axis: Axis.horizontal,
                            axisAlignment: -1,
                            child: Center(
                              child: Container(
                                  height: circleSize,
                                  width: circleSize,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,
                                      color: Colors.white, size: iconSize)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: ScreenSize.fSize_20()),
                      if (color1 == true) ...[
                        Text('Scanning for TVs',
                            style: GoogleFonts.georama(
                                color: const Color(0xff5A3B8B),
                                fontWeight: FontWeight.w500))
                      ] else ...[
                        colors1('Scanning for TVs'),
                      ],
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_25()),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_40()),
                      Stack(
                        children: [
                          Center(
                            child: ScaleTransition(
                              scale: scaleAnimation1,
                              child: Container(
                                height: circleSize,
                                width: circleSize,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          SizeTransition(
                            sizeFactor: checkAnimation1,
                            axis: Axis.horizontal,
                            axisAlignment: -1,
                            child: Center(
                              child: Container(
                                  height: circleSize,
                                  width: circleSize,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,
                                      color: Colors.white, size: iconSize)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: ScreenSize.fSize_20()),
                      if (color2 == true) ...[
                        Text('Detecting Model',
                            style: GoogleFonts.georama(
                                color: const Color(0xff5A3B8B),
                                fontWeight: FontWeight.w500)),
                      ] else ...[
                        colors1('Detecting Model'),
                      ],
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_25()),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_40()),
                      Stack(
                        children: [
                          Center(
                            child: ScaleTransition(
                              scale: scaleAnimation2,
                              child: Container(
                                height: circleSize,
                                width: circleSize,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          SizeTransition(
                            sizeFactor: checkAnimation2,
                            axis: Axis.horizontal,
                            axisAlignment: -1,
                            child: Center(
                              child: Container(
                                  height: circleSize,
                                  width: circleSize,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,
                                      color: Colors.white, size: iconSize)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: ScreenSize.fSize_20()),
                      if (color3 == true) ...[
                        Text('Installing Drivers',
                            style: GoogleFonts.georama(
                                color: const Color(0xff5A3B8B),
                                fontWeight: FontWeight.w500)),
                      ] else ...[
                        colors1('Installing Drivers'),
                      ],
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_25()),
                  Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_40()),
                      Stack(
                        children: [
                          Center(
                            child: ScaleTransition(
                              scale: scaleAnimation3,
                              child: Container(
                                height: circleSize,
                                width: circleSize,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          SizeTransition(
                            sizeFactor: checkAnimation3,
                            axis: Axis.horizontal,
                            axisAlignment: -1,
                            child: Center(
                              child: Container(
                                  height: circleSize,
                                  width: circleSize,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(Icons.check,
                                      color: Colors.white, size: iconSize)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: ScreenSize.fSize_20()),
                      if (color4 == true) ...[
                        Text('Connecting',
                            style: GoogleFonts.georama(
                                color: const Color(0xff5A3B8B),
                                fontWeight: FontWeight.w500)),
                      ] else ...[
                        colors1('Connecting'),
                      ],
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_60()),
//================================================================next button =================================================================
                  Stack(
                    children: [
                      Center(
                        child: ScaleTransition(
                          scale: nextcheckAnimation,
                          child: GestureDetector(
                            onTap: () {
                              controller.showbuttonad(
                                  context,
                                  '/mirror_to_tv_screen',
                                  '/progress_running_screen',
                                  '');
                            },
                            child: Container(
                              height: ScreenSize.horizontalBlockSize! * 12,
                              width: ScreenSize.horizontalBlockSize! * 36,
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
                                  child: Text('NEXT',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: ScreenSize.fSize_17()))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_50()),
                ]),
              ),
            ),
            banner.getBN('/progress_running_screen'),
          ],
        ),
      ),
    );
  }
}
