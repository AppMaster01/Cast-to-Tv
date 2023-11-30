import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../media_qury/media_qury.dart';

final controllertexts = Get.put(textController());
final controllertexts2 = Get.put(text2Controller());
final controllerapp = Get.put(appbarController());
final controllercontain = Get.put(containController());
final controllericon = Get.put(icon());
final controllersmall = Get.put(smallcontain());
final controllerbutton = Get.put(button());
final contollercircle = Get.put(circle());
final contolleruse1 = Get.put(use1());

class textController extends GetxController {
  getext(context, text, style) {
    ScreenSize.sizerInit(context);
    return Text(
      text,
      style: style,
    );
  }
}
class text2Controller extends GetxController {
  getext2(context, text) {
    ScreenSize.sizerInit(context);
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: Color(0xFF5A3B8B),
          fontWeight: FontWeight.w500,
          fontSize: ScreenSize.fSize_20()),
    );
  }
}

class appbarController extends GetxController {
  getbar(onTap, String name, tital) {
    return AppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
      )
      ),
      leading: GestureDetector(
          onTap: onTap,
          child: Center(
              child: Image(
            height: ScreenSize.fSize_20(),
            image: AssetImage('asset/image/icon/back-icon.png'),
          ))),
      elevation: 0,
      backgroundColor: Color(0xFF5A3B8B),
      centerTitle: tital,
      title: Text(name,
          style: GoogleFonts.nunito(
              fontSize: ScreenSize.horizontalBlockSize! * 5,
              fontWeight: FontWeight.w600)),
    );
  }
}

class containController extends GetxController {
  getcontain(context, ontap, String text, image) {
    ScreenSize.sizerInit(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: ScreenSize.horizontalBlockSize! * 30,
        width: ScreenSize.horizontalBlockSize! * 44,
        decoration: BoxDecoration(
            color: Color(0xFFF9F5FF),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2), color: Colors.black26, blurRadius: 2)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(width: ScreenSize.fSize_30(), image: AssetImage(image)),
            SizedBox(height: ScreenSize.fSize_20()),
            Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: ScreenSize.fSize_14(), fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

class icon extends GetxController {
  geticon(context, color1, color2, color3, ontap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.circle,
          size: ScreenSize.fSize_13(),
          color: color1,
          shadows: [
            Shadow(offset: Offset(0, 3), color: Colors.black12, blurRadius: 5)
          ],
        ),
        SizedBox(width: ScreenSize.fSize_6()),
        Icon(
          Icons.circle,
          size: ScreenSize.fSize_13(),
          color: color2,
          shadows: [
            Shadow(offset: Offset(0, 3), color: Colors.black12, blurRadius: 5)
          ],
        ),
        SizedBox(width: ScreenSize.fSize_6()),
        Icon(
          Icons.circle,
          size: ScreenSize.fSize_13(),
          color: color3,
          shadows: [
            Shadow(offset: Offset(0, 3), color: Colors.black12, blurRadius: 5)
          ],
        ),
        SizedBox(width: ScreenSize.fSize_45()),
        GestureDetector(
          onTap: ontap,
          child: Container(
            width: ScreenSize.fSize_110(),
            height: ScreenSize.fSize_50(),
            // color: Colors.black12,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: ScreenSize.horizontalBlockSize! * 23,
                  height: ScreenSize.horizontalBlockSize! * 8.8,
                  decoration: BoxDecoration(
                    color: Color(0xFF5A3B8B),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: ScreenSize.fSize_12()),
                      Text('Next',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: ScreenSize.fSize_14(),
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Positioned(
                  right: ScreenSize.fSize_12(),
                  child: Container(
                      height: ScreenSize.fSize_40(),
                      width: ScreenSize.fSize_40(),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFF5A3B8B), width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Center(
                        child: Image(
                            width: ScreenSize.fSize_25(),
                            image:
                                AssetImage('asset/image/icon/next-icon.png')),
                      )),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: ScreenSize.fSize_3()),
      ],
    );
  }
}

class smallcontain extends GetxController {
  getsmall(context, String text) {
    ScreenSize.sizerInit(context);
    return GestureDetector(
      onTap: () {
        controller.showbuttonad(context, '/select_year_screen', '/select_tv','');
      },
      child: Container(
        height: ScreenSize.horizontalBlockSize! * 12.5,
        width: ScreenSize.horizontalBlockSize! * 45.9,
        decoration: BoxDecoration(
            color: Color(0xFFF9F5FF),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2), color: Colors.black26, blurRadius: 2)
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: ScreenSize.fSize_3()),
              Row(
                children: [
                  SizedBox(width: ScreenSize.fSize_3()),
                  Image(
                      width: ScreenSize.fSize_23(),
                      image: AssetImage('asset/image/icon/smart-tv-icon.png')),
                  SizedBox(width: ScreenSize.fSize_8()),
                  Container(
                    width: ScreenSize.horizontalBlockSize! * 25.9,
                    // color: Colors.black45,
                    child: Text(
                      text,
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w400,
                          fontSize: ScreenSize.fSize_15()),
                    ),
                  ),
                ],
              ),
              // SizedBox(width: ScreenSize.fSize_10()),

              Image(
                  width: ScreenSize.fSize_20(),
                  image: AssetImage('asset/image/icon/add.png')),
              // SizedBox(width: ScreenSize.fSize_3()),
            ],
          ),
        ),
      ),
    );
  }
}

class button extends GetxController {
  getbutton(context, ontap, text) {
    ScreenSize.sizerInit(context);
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: ScreenSize.horizontalBlockSize! * 12,
        width: ScreenSize.horizontalBlockSize! * 36,
        decoration: BoxDecoration(
            color: Color(0xFF5A3B8B),
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 2), color: Colors.black26, blurRadius: 2)
            ]),
        child: Center(
            child: Text(text,
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenSize.fSize_17()))),
      ),
    );
  }
}



class circle extends GetxController {
  getcircle(context, hight, waith, ontap, image) {
    ScreenSize.sizerInit(context);
    return Container(
      width: hight,
      height: waith,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Center(
          child:
              Image(height: ScreenSize.fSize_30(), image: AssetImage(image))),
    );
  }
}



class use1 extends GetxController {
  getuse(context) {
    ScreenSize.sizerInit(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: ScreenSize.fSize_10()),
          Center(
              child: Image(
                  height: ScreenSize.horizontalBlockSize! * 75,
                  image: const AssetImage(
                      'asset/image/how-to-use-vector-1.png'))),
          SizedBox(height: ScreenSize.fSize_50()),
          Text(
            """  Please make sure that your
phone and TV are connected
  to the same WiFi network.""",
            style: GoogleFonts.originalSurfer(
                fontWeight: FontWeight.w400,
                fontSize: ScreenSize.fSize_16()),
          ),
          SizedBox(height: ScreenSize.fSize_15()),
          controllericon.geticon(context, const Color(0xFF5A3B8B),
              const Color(0xFFC9A9FF), const Color(0xFFC9A9FF), () {
                controller.showbuttonad(
                    context, '/How_to_use2', '/How_to_use1','');
              }),
          SizedBox(height: ScreenSize.fSize_80()),
        ],
      ),
    );
  }
}
