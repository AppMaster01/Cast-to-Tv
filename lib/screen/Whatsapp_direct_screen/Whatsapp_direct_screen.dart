
// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'dart:io';

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/media_qury/media_qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:url_launcher/url_launcher.dart';

class Whatsapp_direct_screen extends StatefulWidget {
  const Whatsapp_direct_screen({Key? key}) : super(key: key);

  @override
  State<Whatsapp_direct_screen> createState() => Whatsapp_direct_screenState();
}

class Whatsapp_direct_screenState extends State<Whatsapp_direct_screen> {
  TextEditingController code = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController massage = TextEditingController();
  bool whatapp = true;

  // WhatsApp whatsapp = WhatsApp();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/Whatsapp_direct_screen'),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(
              context, '/Whatsapp_direct_screen');
        }, "Whatsapp Direct", true),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_50()),
                    Image(
                        height: ScreenSize.horizontalBlockSize! * 45,
                        image: const AssetImage('asset/image/cast-to-tv-vector.png')),
                    SizedBox(height: ScreenSize.fSize_50()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: ScreenSize.horizontalBlockSize! * 13,
                          width: ScreenSize.horizontalBlockSize! * 32,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF9F5FF),
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: const [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    color: Colors.black26,
                                    blurRadius: 2)
                              ]),
                          child: IntlPhoneField(
                            readOnly: true,
                            initialCountryCode: "IN",
                            disableLengthCheck: true,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              fillColor: Colors.transparent,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                            ),
                          ),
                        ),
                        Stack(
                          children: [
                            Container(
                              height: ScreenSize.horizontalBlockSize! * 13,
                              width: ScreenSize.horizontalBlockSize! * 57,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFF9F5FF),
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(0, 2),
                                        color: Colors.black26,
                                        blurRadius: 2)
                                  ]),
                              child: TextField(
                                controller: number,
                                scrollController: ScrollController(),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  hintText: 'Mobile Number',
                                  hintStyle: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                      fontSize: ScreenSize.fSize_13()),
                                  contentPadding:
                                      EdgeInsetsDirectional.symmetric(
                                          horizontal:
                                              ScreenSize.horizontalBlockSize! *
                                                  14,
                                          vertical: ScreenSize.fSize_12()),

                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  // focusedErrorBorder: OutlineInputBorder(
                                  //     borderSide: BorderSide(color: Colors.transparent)),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: ScreenSize.fSize_3()),
                              child: Container(
                                height: ScreenSize.horizontalBlockSize! * 12,
                                width: ScreenSize.horizontalBlockSize! * 12,
                                decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(100),
                                        bottomLeft: Radius.circular(100))),
                                child: Center(
                                  child: Image(
                                      height:
                                          ScreenSize.horizontalBlockSize! * 6.5,
                                      image: const AssetImage(
                                          'asset/image/icon/phone-icon.png')),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: ScreenSize.fSize_23()),
                    Container(
                      height: ScreenSize.horizontalBlockSize! * 40,
                      width: ScreenSize.horizontalBlockSize! * 90,
                      decoration: BoxDecoration(
                          color: const Color(0xFFF9F5FF),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 2),
                                color: Colors.black26,
                                blurRadius: 2)
                          ]),
                      child: TextField(
                        // scrollController: ScrollController(),
                        controller: massage,
                        keyboardType: TextInputType.text,
                        maxLines: null,
                        decoration: InputDecoration(
                          alignLabelWithHint: true,
                          hintText: 'Enter Message',
                          hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: ScreenSize.fSize_13()),
                          contentPadding: EdgeInsetsDirectional.symmetric(
                              horizontal: ScreenSize.horizontalBlockSize! * 5,
                              vertical: ScreenSize.fSize_12()),
                          // fillColor: Colors.transparent,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          // floatingLabelBehavior: FloatingLabelBehavior.auto
                          // focusedErrorBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.transparent)),
                        ),
                      ),
                    ),
                    SizedBox(height: ScreenSize.horizontalBlockSize! * 15),
                    controllerbutton.getbutton(context, () {
                      // OpenWhatApp();
                      // Share.share(
                      //     'https://play.google.com/store/apps/details?id=com.whatsapp');
                      WhatApplaunch();
                    }, 'Send'),
                    SizedBox(height: ScreenSize.fSize_15()),
                  ],
                ),
              ),
            ),
            banner.getBN('/Whatsapp_direct_screen')
          ],
        ),
      ),
    );
  }

  // openWhatsapp(
  //     {required BuildContext context,
  //     required String text,
  //     required String number}) async {
  //   var whatsapp = number; //+92xx enter like this
  //   var whatsappURlAndroid =
  //       "whatsapp://send?phone=" + "${"+91"}" + whatsapp + "&text=$text";
  //   if (Platform.isAndroid) {
  //     if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
  //       await launchUrl(Uri.parse(
  //         whatsappURlAndroid,
  //       ));
  //     } else {
  //       if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
  //         await launchUrl(Uri.parse(whatsappURlAndroid));
  //       } else {
  //         launchUrl(Uri.parse("https://www.whatsapp.com/"));
  //       }
  //     }
  //   }
  // }
  WhatApplaunch() async {
    FocusManager.instance.primaryFocus?.unfocus();
    var whatsappUrl = "whatsapp://send?phone= ${number.text}"
        "&text=${massage.text}";
    var not = "https://www.whatsapp.com/";
    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
        await launchUrl(Uri.parse(whatsappUrl));
      } else {
        if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
          await launchUrl(Uri.parse(whatsappUrl));
        } else {
          launchUrl(Uri.parse(not));
          // ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(content: Text("Whatsapp not installed")));
        }
      }
    }
  }
}
