// // ignore_for_file: camel_case_types, duplicate_ignore
//
// import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
// import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
// import 'package:cast_tv/Controller_Page/Google_Ads.dart';
// import 'package:cast_tv/media_qury/media_qury.dart';
// import 'package:cast_tv/Widget_controllers/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class progress_complete_screen extends StatefulWidget {
//   const progress_complete_screen({Key? key}) : super(key: key);
//
//   @override
//   State<progress_complete_screen> createState() =>
//       _progress_complete_screenState();
// }
//
// class _progress_complete_screenState extends State<progress_complete_screen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () =>backbuttoncontroller.showBackbuttonad(
//           context, '/progress_complete_screen') ,
//       child: Scaffold(
//         appBar: controllerapp.getbar(() {
//           backbuttoncontroller.showBackbuttonad(
//               context, '/progress_complete_screen');
//         }, 'Cast To TV', true),
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Center(
//                 child: Column(children: [
//                   SizedBox(height: ScreenSize.fSize_30()),
//                   Image(
//                       height: ScreenSize.horizontalBlockSize! * 60,
//                       image: const AssetImage(
//                           'asset/image/Progress running illustration.png')),
//                   SizedBox(height: ScreenSize.fSize_50()),
//                   controllertexts.getext(
//                       context,
//                       'Progress Complete',
//                       GoogleFonts.poppins(
//                           fontWeight: FontWeight.w600,
//                           fontSize: ScreenSize.fSize_23())),
//                   SizedBox(height: ScreenSize.fSize_50()),
//                   contollerchekok.getark(context, 'Scanning for TVs'),
//                   SizedBox(height: ScreenSize.fSize_30()),
//                   contollerchekok.getark(context, 'Detecting Model'),
//                   SizedBox(height: ScreenSize.fSize_30()),
//                   contollerchekok.getark(context, 'Installing Drivers'),
//                   SizedBox(height: ScreenSize.fSize_30()),
//                   contollerchekok.getark(context, 'Connecting'),
//                   SizedBox(height: ScreenSize.fSize_50()),
//                   controllerbutton.getbutton(context, () {
//                     controller.showbuttonad(context, '/mirror_to_tv_screen',
//                         '/progress_complete_screen','');
//                   }, 'NEXT'),
//                   SizedBox(height: ScreenSize.fSize_80()),
//                 ]),
//               ),
//             ),
//             banner.getBN('/progress_complete_screen'),
//           ],
//         ),
//       ),
//     );
//   }
// }
