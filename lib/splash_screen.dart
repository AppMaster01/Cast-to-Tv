// ignore_for_file: must_be_immutable

import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:ui' as ui;

import 'Controller_Page/My_Controller.dart';
import 'media_qury/media_qury.dart';

// ignore: camel_case_types
class Splash_Screen extends StatelessWidget {
  Splash_Screen({Key? key}) : super(key: key);

  MyAppController myAppController = Get.put(MyAppController());

  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);
    return Scaffold(
      backgroundColor: const Color(0xFFecdcfc),
      body: Stack(
        children: [
          Positioned(
              bottom: ScreenSize.horizontalBlockSize! * 58,
              left: ScreenSize.horizontalBlockSize! * 0,
              child: const Image(image: AssetImage('asset/image/Rectangle 6.png'))),
          Positioned(
              bottom: ScreenSize.horizontalBlockSize! * 0,
              right: ScreenSize.horizontalBlockSize! * 0,
              child: Image(
                  height: ScreenSize.horizontalBlockSize! * 90,
                  image: const AssetImage('asset/image/Rectangle 4.png'))),
          Positioned(
              bottom: ScreenSize.horizontalBlockSize! * 10,
              right: ScreenSize.horizontalBlockSize! * 0,
              child: Image(
                  height: ScreenSize.horizontalBlockSize! * 90,
                  image: const AssetImage('asset/image/Rectangle 5.png'))),
          Positioned(
            right: 0,
            child: CustomPaint(
              size: ui.Size(ScreenSize.horizontalBlockSize! * 45,
                  ScreenSize.horizontalBlockSize! * 48),
              painter: AB(),
            ),
          ),
          Positioned(
            right: 0,
            child: CustomPaint(
              size: ui.Size(ScreenSize.horizontalBlockSize! * 45,
                  ScreenSize.horizontalBlockSize! * 40),
              painter: RPSCustomPainter(),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: ScreenSize.horizontalBlockSize! * 45,
                ),
                Image(
                    height: ScreenSize.fSize_150(),
                    image: const AssetImage('asset/image/logo/logo.png')),
                SizedBox(height: ScreenSize.fSize_40()),
                controllertexts.getext(
                    context,
                    'Cast To TV',
                    GoogleFonts.philosopher(
                      color: const Color(0xFF5A3B8B),
                      fontWeight: FontWeight.w700,
                      fontSize: ScreenSize.fSize_40(),
                    )),
                SizedBox(
                  height: ScreenSize.horizontalBlockSize! * 50,
                ),
                LoadingAnimationWidget.prograssiveDots(
                    color: const Color(0xFF5A3B8B), size: ScreenSize.fSize_60())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AB extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height);
    path_0.cubicTo(size.width * 0.3039550, size.height * 0.9301449,
        size.width * 0.04331450, size.height * 0.3757420, 0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.close();

    Paint paint0Fill = Paint()
      ..color = const Color(0xFFD7BEFF)
      ..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.09750000, size.height * -0.000003072964),
        Offset(size.width, size.height),
        [const Color(0xffD7BEFF).withOpacity(1), const Color(0xffD7BEFF).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height);
    path_0.cubicTo(size.width * 0.3039550, size.height * 0.9301449,
        size.width * 0.04331450, size.height * 0.3757420, 0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.09750000, size.height * -0.000003072964),
        Offset(size.width, size.height),
        [const Color(0xffF5EFFF).withOpacity(1), const Color(0xffD2B7FF).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
