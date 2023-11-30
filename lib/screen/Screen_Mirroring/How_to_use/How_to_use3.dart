  // // ignore_for_file: camel_case_types
  //
  // import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
  // import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
  // import 'package:cast_tv/Controller_Page/Google_Ads.dart';
  // import 'package:cast_tv/media_qury/media_qury.dart';
  // import 'package:cast_tv/Widget_controllers/controller.dart';
  // import 'package:flutter/material.dart';
  // import 'package:google_fonts/google_fonts.dart';
  //
  // class How_to_use3 extends StatefulWidget {
  //   const How_to_use3({Key? key}) : super(key: key);
  //
  //   @override
  //   State<How_to_use3> createState() => _How_to_use3State();
  // }
  //
  // class _How_to_use3State extends State<How_to_use3> {
  //   @override
  //   Widget build(BuildContext context) {
  //     return WillPopScope(
  //       onWillPop: () =>
  //           backbuttoncontroller.showBackbuttonad(context, '/How_to_use3'),
  //       child: Scaffold(
  //         appBar: controllerapp.getbar(() {
  //           backbuttoncontroller.showBackbuttonad(context, '/How_to_use3');
  //         }, 'How to use', false),
  //         body: Stack(
  //           children: [
  //             SingleChildScrollView(
  //               physics: const BouncingScrollPhysics(),
  //               child: Column(
  //                 children: [
  //                   native.getNT('/How_to_use1', 'listTile'),
  //                   SizedBox(height: ScreenSize.fSize_90()),
  //                   Center(
  //                       child: Image(
  //                           height: ScreenSize.horizontalBlockSize! * 85,
  //                           image: const AssetImage(
  //                               'asset/image/how-to-use-vector-3.png'))),
  //                   SizedBox(height: ScreenSize.fSize_80()),
  //                   Center(
  //                     child: Text(
  //                       textAlign: TextAlign.center,
  //                       """Click NEXT button, for
  // enable Wireless Display &
  // choose your TV""",
  //                       style: GoogleFonts.originalSurfer(
  //                           fontWeight: FontWeight.w400,
  //                           fontSize: ScreenSize.fSize_18()),
  //                     ),
  //                   ),
  //                   SizedBox(height: ScreenSize.fSize_50()),
  //                   controllericon.geticon(context, const Color(0xFFC9A9FF),
  //                       const Color(0xFFC9A9FF), const Color(0xFF5A3B8B), () {
  //                     controller.showbuttonad(
  //                         context, '/Cast_To_TV', '/How_to_use3','');
  //                   }),
  //                   SizedBox(height: ScreenSize.fSize_80()),
  //                 ],
  //               ),
  //             ),
  //             banner.getBN('/How_to_use1')
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }
