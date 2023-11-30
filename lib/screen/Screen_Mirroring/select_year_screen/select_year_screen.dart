// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controller_Page/Google_Ads.dart';
import '../../../media_qury/media_qury.dart';

List year = [
  "2001-2005",
  "2006-2010",
  "2011-2015",
  "2016-2020",
  "2021-2025",
  "2001-2005",
  "2006-2010",
];

class select_year_screen extends StatefulWidget {
  const select_year_screen({Key? key}) : super(key: key);

  @override
  State<select_year_screen> createState() => _select_year_screenState();
}

class _select_year_screenState extends State<select_year_screen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=>
          backbuttoncontroller.showBackbuttonad(context, '/select_year_screen'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/select_year_screen');
        }, 'Cast To TV', true),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  controllertexts.getext(
                      context,
                      'Select TV Model - Year',
                      GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenSize.fSize_20(),
                        color: Colors.black,
                      )),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Container(
                      height: ScreenSize.horizontalBlockSize! * 120,
                      width: ScreenSize.horizontalBlockSize! * 92,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF9F5FF),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 2),
                                color: Colors.black26,
                                blurRadius: 2)
                          ]),
                      child: Column(
                        children: [
                          SizedBox(height: ScreenSize.horizontalBlockSize! * 15),
                          Center(
                            child: Container(
                              height: ScreenSize.horizontalBlockSize! * 70,
                              width: ScreenSize.horizontalBlockSize! * 60,
                              color: Colors.transparent,
                              child: Center(
                                child: CupertinoPicker(
                                  magnification: 2,
                                  backgroundColor: Colors.transparent,
                                  itemExtent: 40,
                                  selectionOverlay: Container(
                                    color: Colors.transparent,
                                  ),
                                  looping: true,
                                  diameterRatio: 1.5,
                                  onSelectedItemChanged: (int value) {},
                                  children: <Widget>[
                                    controllertexts2.getext2(
                                        context, '2001-2005'),
                                    controllertexts2.getext2(
                                        context, '2006-2010'),
                                    controllertexts2.getext2(
                                        context, '2011-2015'),
                                    controllertexts2.getext2(
                                        context, '2016-2020'),
                                    controllertexts2.getext2(
                                        context, '2021-2025'),
                                    controllertexts2.getext2(
                                        context, '2001-2005'),
                                    controllertexts2.getext2(
                                        context, '2006-2010'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenSize.horizontalBlockSize! * 15),
                          controllerbutton.getbutton(context, () {
                            controller.showbuttonad(
                                context,
                                '/progress_running_screen',
                                '/select_year_screen','');
                          }, 'NEXT')
                        ],
                      )),
                  SizedBox(height: ScreenSize.fSize_80()),
                ],
              ),
            ),
            banner.getBN('/select_year_screen')
          ],
        ),
      ),
    );
  }
}
