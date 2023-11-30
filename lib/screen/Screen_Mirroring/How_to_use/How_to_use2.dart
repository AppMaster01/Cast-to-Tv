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
// class How_to_use2 extends StatefulWidget {
//   const How_to_use2({Key? key}) : super(key: key);
//
//   @override
//   State<How_to_use2> createState() => _How_to_use2State();
// }
//
// class _How_to_use2State extends State<How_to_use2> {
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () =>
//           backbuttoncontroller.showBackbuttonad(context, '/How_to_use2'),
//       child: Scaffold(
//         appBar: controllerapp.getbar(() {
//           backbuttoncontroller.showBackbuttonad(context, '/How_to_use2');
//         }, 'How to use', false),
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 children: [
//                   native.getNT('/How_to_use1', 'listTile'),
//                   SizedBox(height: ScreenSize.fSize_140()),
//                   Stack(
//                     children: [
//                       Center(
//                           child: Image(
//                               height: ScreenSize.horizontalBlockSize! * 50,
//                               image: const AssetImage(
//                                   'asset/image/how-to-use-vector-2.png'))),
//                       Column(
//                         children: [
//                           SizedBox(height: ScreenSize.fSize_90()),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               const Image(image: AssetImage('asset/image/Group.png')),
//                               SizedBox(width: ScreenSize.fSize_45()),
//                             ],
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                   SizedBox(height: ScreenSize.fSize_140()),
//                   Center(
//                     child: Text(
//                       textAlign: TextAlign.center,
//                       """       Make sure that Wireless
// display enabled and supported
// by your TV model.""",
//                       style: GoogleFonts.originalSurfer(
//                           fontWeight: FontWeight.w400,
//                           fontSize: ScreenSize.fSize_18()),
//                     ),
//                   ),
//                   SizedBox(height: ScreenSize.fSize_50()),
//                   controllericon.geticon(context, const Color(0xFFC9A9FF),
//                       const Color(0xFF5A3B8B), const Color(0xFFC9A9FF), () {
//                     controller.showbuttonad(
//                         context, '/How_to_use3', '/How_to_use2','');
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
