// // // ignore_for_file: camel_case_types
// //
// // import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
// // import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
// // import 'package:cast_tv/Controller_Page/Google_Ads.dart';
// // import 'package:cast_tv/media_qury/media_qury.dart';
// // import 'package:cast_tv/Widget_controllers/controller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// //
// // class How_to_use1 extends StatefulWidget {
// //   const How_to_use1({Key? key}) : super(key: key);
// //
// //   @override
// //   State<How_to_use1> createState() => _How_to_use1State();
// // }
// //
// // class _How_to_use1State extends State<How_to_use1> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return WillPopScope(
// //       onWillPop: () =>
// //           backbuttoncontroller.showBackbuttonad(context, '/How_to_use1'),
// //       child: Scaffold(
// //         appBar: controllerapp.getbar(() {
// //           backbuttoncontroller.showBackbuttonad(context, '/How_to_use1');
// //         }, 'How to use', false),
// //         body: Stack(
// //           children: [
// //             SingleChildScrollView(
// //               physics: const BouncingScrollPhysics(),
// //               child: Column(
// //                 children: [
// //                   native.getNT('/How_to_use1', 'listTile'),
// //                   SizedBox(height: ScreenSize.fSize_10()),
// //                   Center(
// //                       child: Image(
// //                           height: ScreenSize.horizontalBlockSize! * 75,
// //                           image: const AssetImage(
// //                               'asset/image/how-to-use-vector-1.png'))),
// //                   SizedBox(height: ScreenSize.fSize_50()),
// //                   Text(
// //                     """  Please make sure that your
// // phone and TV are connected
// //   to the same WiFi network.""",
// //                     style: GoogleFonts.originalSurfer(
// //                         fontWeight: FontWeight.w400,
// //                         fontSize: ScreenSize.fSize_16()),
// //                   ),
// //                   SizedBox(height: ScreenSize.fSize_15()),
// //                   controllericon.geticon(context, const Color(0xFF5A3B8B),
// //                       const Color(0xFFC9A9FF), const Color(0xFFC9A9FF), () {
// //                     controller.showbuttonad(
// //                         context, '/How_to_use2', '/How_to_use1','');
// //                   }),
// //                   SizedBox(height: ScreenSize.fSize_80()),
// //                 ],
// //               ),
// //             ),
// //             banner.getBN('/How_to_use1')
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
// import 'package:cast_tv/Widget_controllers/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intro_views_flutter/intro_views_flutter.dart';
//
// import '../../../Controller_Page/Button_controller/Main_Controller.dart';
// import '../../../Media_Qury/Media_Qury.dart';
//
// class How_to_use1 extends StatelessWidget {
//   final pages = [
//     PageViewModel(
//       body: Center(
//         child: Text(
//           """Please make sure that your
// phone and TV are connected
// to the same WiFi network.""",
//         ),
//       ),
//       bodyTextStyle: GoogleFonts.originalSurfer(
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           fontSize: ScreenSize.fSize_18()),
//       mainImage: Center(
//         child: Image.asset(
//           'asset/image/how-to-use-vector-1.png',
//           height: ScreenSize.fSize_250(),
//           alignment: Alignment.center,
//         ),
//       ),
//     ),
//     PageViewModel(
//       iconImageAssetPath: 'asset/image/icon/Ellipse 1.png',
//       body: Text(
//         """Make sure that Wireless display enabled and supported
// by your TV model.""",
//       ),
//       bodyTextStyle: GoogleFonts.originalSurfer(
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           fontSize: ScreenSize.fSize_18()),
//       mainImage: Image.asset(
//         'asset/image/how-to-use-vector-2.png',
//         height: ScreenSize.fSize_250(),
//         alignment: Alignment.center,
//       ),
//     ),
//     PageViewModel(
//       iconImageAssetPath: 'asset/image/icon/Ellipse 1.png',
//       body: Text("""Click NEXT button, for
// enable Wireless Display &
// choose your TV"""),
//       bodyTextStyle: GoogleFonts.originalSurfer(
//           color: Colors.black,
//           fontWeight: FontWeight.w400,
//           fontSize: ScreenSize.fSize_18()),
//       mainImage: Image.asset(
//         'asset/image/how-to-use-vector-3.png',
//         height: ScreenSize.fSize_250(),
//         alignment: Alignment.center,
//       ),
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: controllerapp.getbar(() {
//         backbuttoncontroller.showBackbuttonad(context, '/Home_page');
//       }, 'How to use', false),
//       body: Stack(
//         children: [
//           Builder(
//             builder: (context) => IntroViewsFlutter(
//               pages,
//               showNextButton: true,
//               nextText: Container(
//                 width: ScreenSize.fSize_110(),
//                 height: ScreenSize.fSize_50(),
//                 // color: Colors.black12,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       width: ScreenSize.horizontalBlockSize! * 23,
//                       height: ScreenSize.horizontalBlockSize! * 8.8,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF5A3B8B),
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: ScreenSize.fSize_12()),
//                           Text('Next',
//                               style: GoogleFonts.poppins(
//                                   color: Colors.white,
//                                   fontSize: ScreenSize.fSize_14(),
//                                   fontWeight: FontWeight.w500)),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       right: ScreenSize.fSize_12(),
//                       child: Container(
//                           height: ScreenSize.fSize_40(),
//                           width: ScreenSize.fSize_40(),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xFF5A3B8B), width: 3),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(100))),
//                           child: Center(
//                             child: Image(
//                                 width: ScreenSize.fSize_25(),
//                                 image: AssetImage(
//                                     'asset/image/icon/next-icon.png')),
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//               doneText: Container(
//                 width: ScreenSize.fSize_110(),
//                 height: ScreenSize.fSize_50(),
//                 // color: Colors.black12,
//                 child: Stack(
//                   alignment: Alignment.center,
//                   children: [
//                     Container(
//                       width: ScreenSize.horizontalBlockSize! * 23,
//                       height: ScreenSize.horizontalBlockSize! * 8.8,
//                       decoration: BoxDecoration(
//                         color: Color(0xFF5A3B8B),
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: ScreenSize.fSize_12()),
//                           Text('Next',
//                               style: GoogleFonts.poppins(
//                                   color: Colors.white,
//                                   fontSize: ScreenSize.fSize_14(),
//                                   fontWeight: FontWeight.w500)),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       right: ScreenSize.fSize_12(),
//                       child: Container(
//                           height: ScreenSize.fSize_40(),
//                           width: ScreenSize.fSize_40(),
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               border: Border.all(
//                                   color: Color(0xFF5A3B8B), width: 3),
//                               borderRadius:
//                                   BorderRadius.all(Radius.circular(100))),
//                           child: Center(
//                             child: Image(
//                                 width: ScreenSize.fSize_25(),
//                                 image: AssetImage(
//                                     'asset/image/icon/next-icon.png')),
//                           )),
//                     )
//                   ],
//                 ),
//               ),
//               onTapDoneButton: () {
//                 controller.showbuttonad(
//                     context, '/select_tv', '/How_to_use1', '');
//               },
//             ),
//           ),
//           // Positioned(
//           //   bottom: ScreenSize.fSize_40(),
//           //   left: ScreenSize.horizontalBlockSize! * 40,
//           //   child: Row(
//           //     mainAxisAlignment: MainAxisAlignment.center,
//           //     children: [
//           //       Icon(
//           //         Icons.circle,
//           //         size: ScreenSize.fSize_13(),
//           //         color: Colors.black,
//           //         shadows: [
//           //           Shadow(
//           //               offset: Offset(0, 3),
//           //               color: Colors.black12,
//           //               blurRadius: 5)
//           //         ],
//           //       ),
//           //       SizedBox(width: ScreenSize.fSize_6()),
//           //       Icon(
//           //         Icons.circle,
//           //         size: ScreenSize.fSize_13(),
//           //         color: Colors.green,
//           //         shadows: [
//           //           Shadow(
//           //               offset: Offset(0, 3),
//           //               color: Colors.black12,
//           //               blurRadius: 5)
//           //         ],
//           //       ),
//           //       SizedBox(width: ScreenSize.fSize_6()),
//           //       Icon(
//           //         Icons.circle,
//           //         size: ScreenSize.fSize_13(),
//           //         color: Colors.red,
//           //         shadows: [
//           //           Shadow(
//           //               offset: Offset(0, 3),
//           //               color: Colors.black12,
//           //               blurRadius: 5)
//           //         ],
//           //       ),
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }
// }
// // Positioned(
// // bottom: ScreenSize.fSize_40(),
// // left: ScreenSize.horizontalBlockSize! * 40,
// // child: Row(
// // mainAxisAlignment: MainAxisAlignment.center,
// // children: [
// // Icon(
// // Icons.circle,
// // size: ScreenSize.fSize_13(),
// // color: Color(0xff5A3B8B),
// // shadows: [
// // Shadow(
// // offset: Offset(0, 3),
// // color: Colors.black12,
// // blurRadius: 5)
// // ],
// // ),
// // SizedBox(width: ScreenSize.fSize_6()),
// // Icon(
// // Icons.circle,
// // size: ScreenSize.fSize_13(),
// // color: Color(0xffC9A9FF),
// // shadows: [
// // Shadow(
// // offset: Offset(0, 3),
// // color: Colors.black12,
// // blurRadius: 5)
// // ],
// // ),
// // SizedBox(width: ScreenSize.fSize_6()),
// // Icon(
// // Icons.circle,
// // size: ScreenSize.fSize_13(),
// // color: Color(0xffC9A9FF),
// // shadows: [
// // Shadow(
// // offset: Offset(0, 3),
// // color: Colors.black12,
// // blurRadius: 5)
// // ],
// // ),
// // ],
// // ),
// // ),

// ignore_for_file: camel_case_types, library_private_types_in_public_api, sized_box_for_whitespace

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../Controller_Page/Google_Ads.dart';
import '../../../Media_Qury/Media_Qury.dart';

class How_to_use1 extends StatefulWidget {
  const How_to_use1({super.key});

  @override
  _How_to_use1State createState() => _How_to_use1State();
}

class _How_to_use1State extends State<How_to_use1> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (_) => const select_tv()),
    // );
    controller.showbuttonad(context, '/select_tv', '/How_to_use1', '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        )),
        leading: GestureDetector(
            onTap: () {
              backbuttoncontroller.showBackbuttonad(context, '/Home_page');
            },
            child: Center(
                child: Image(
              height: ScreenSize.fSize_20(),
              image: const AssetImage('asset/image/icon/back-icon.png'),
            ))),
        elevation: 0,
        backgroundColor: const Color(0xFF5A3B8B),
        title: Text('How to use',
            style: GoogleFonts.nunito(
                fontSize: ScreenSize.horizontalBlockSize! * 5,
                fontWeight: FontWeight.w600)),
      ),
      body: Stack(
        children: [
          Container(
            height: ScreenSize.horizontalBlockSize! * 170,
            width: double.infinity,
            child: IntroductionScreen(
              key: introKey,
              globalBackgroundColor: Colors.white,
              pages: [
                PageViewModel(
                  decoration: PageDecoration(
                    // imagePadding: EdgeInsets.only(top: ScreenSize.fSize_20()),
                    imageFlex: 4,
                    bodyFlex: 2,

                    bodyTextStyle: GoogleFonts.originalSurfer(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenSize.fSize_15()),
                  ),
                  title: "",
                  body: """Please make sure that your
phone and TV are connected
to the same WiFi network.""",
                  image: Image(
                      image: const AssetImage(
                          'asset/image/how-to-use-vector-1.png'),
                      height: ScreenSize.horizontalBlockSize! * 40),
                ),
                PageViewModel(
                  decoration: PageDecoration(
                    bodyAlignment: Alignment.center,
                    imageFlex: 10,
                    bodyFlex: 4,
                    bodyTextStyle: GoogleFonts.originalSurfer(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenSize.fSize_16()),
                  ),
                  title: "",
                  body: """Make sure that Wireless display enabled and supported
by your TV model.""",
                  image: Container(
                    // color: Colors.black,
                    height: ScreenSize.horizontalBlockSize!*42,
                    width: ScreenSize.horizontalBlockSize!*52,
                    child: Stack(
                      children: [
                        Image(
                            height: ScreenSize.horizontalBlockSize! * 38,
                            image: const AssetImage(
                                'asset/image/how-to-use-vector-2.png')),
                        Positioned(
                          top: ScreenSize.fSize_70(),
                          left: ScreenSize.horizontalBlockSize!*32,
                          child: Center(
                            child: Image(
                                image: AssetImage('asset/image/Group.png')),
                          ),
                        ),

                      ],
                    ),
                  ),
                  // Container(
                  //   width: 100,
                  //   height: 100,
                  //   child: Stack(
                  //     children: [
                  //       Center(
                  //           child: Image(
                  //               height: ScreenSize.horizontalBlockSize! * 40,
                  //               image: const AssetImage(
                  //                   'asset/image/how-to-use-vector-2.png'))),
                  //       Column(
                  //         children: [
                  //           SizedBox(height: ScreenSize.horizontalBlockSize! * 15),
                  //           Row(
                  //             mainAxisAlignment: MainAxisAlignment.end,
                  //             children: [
                  //                Center(
                  //                  child: Image(
                  //                     image: AssetImage('asset/image/Group.png')),
                  //                ),
                  //               SizedBox(width: ScreenSize.fSize_10()),
                  //             ],
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                ),
                PageViewModel(
                  decoration: PageDecoration(
                    bodyAlignment: Alignment.center,
                    imageFlex: 4,
                    bodyFlex: 2,
                    imagePadding: const EdgeInsets.all(1),
                    bodyTextStyle: GoogleFonts.originalSurfer(
                        fontWeight: FontWeight.w400,
                        fontSize: ScreenSize.fSize_16()),
                  ),
                  title: "",
                  body: """Click NEXT button, for
enable Wireless Display &
choose your TV""",
                  image: Image(
                      image: const AssetImage(
                          'asset/image/how-to-use-vector-3.png'),
                      height: ScreenSize.horizontalBlockSize! * 40),
                ),
              ],
              onDone: () => _onIntroEnd(context),
              next: Container(
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
                        color: const Color(0xFF5A3B8B),
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
                      right: ScreenSize.fSize_4(),
                      child: Container(
                          height: ScreenSize.fSize_40(),
                          width: ScreenSize.fSize_40(),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color(0xFF5A3B8B), width: 3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100))),
                          child: Center(
                            child: Image(
                                width: ScreenSize.fSize_25(),
                                image: const AssetImage(
                                    'asset/image/icon/next-icon.png')),
                          )),
                    )
                  ],
                ),
              ),
              nextStyle: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              doneStyle: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              done: Container(
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
                        color: const Color(0xFF5A3B8B),
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
                      right: ScreenSize.fSize_4(),
                      child: Container(
                          height: ScreenSize.fSize_40(),
                          width: ScreenSize.fSize_40(),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: const Color(0xFF5A3B8B), width: 3),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100))),
                          child: Center(
                            child: Image(
                                width: ScreenSize.fSize_25(),
                                image: const AssetImage(
                                    'asset/image/icon/next-icon.png')),
                          )),
                    )
                  ],
                ),
              ),
              dotsDecorator: const DotsDecorator(
                size: Size(10.0, 10.0),
                activeColor: Color(0xff5A3B8B),
                color: Color(0xffC9A9FF),
                activeSize: Size(10.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              dotsContainerDecorator: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
          native.getNT('/How_to_use1', 'listTile'),
          banner.getBN('/How_to_use1'),
        ],
      ),
    );
  }
}
