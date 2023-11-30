// import 'package:cast_tv/Widget_controllers/controller.dart';
// import 'package:cast_tv/media_qury/media_qury.dart';
// import 'package:flutter/material.dart';
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class Demo extends StatefulWidget {
//   const Demo({Key? key}) : super(key: key);
//
//   @override
//   State<Demo> createState() => _DemoState();
// }
//
// class _DemoState extends State<Demo> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => AnimatedCheck(),
//                     ));
//               },
//               child: Text('data'))),
//     );
//   }
// }
//
// class AnimatedCheck extends StatefulWidget {
//   @override
//   _AnimatedCheckState createState() => _AnimatedCheckState();
// }
//
// class _AnimatedCheckState extends State<AnimatedCheck>
//     with TickerProviderStateMixin {
//   late AnimationController scaleController =
//       AnimationController(duration: const Duration(seconds: 0), vsync: this);
//   late Animation<double> scaleAnimation =
//       CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
//   late AnimationController checkController =
//       AnimationController(duration: const Duration(seconds: 1), vsync: this);
//   late Animation<double> checkAnimation =
//       CurvedAnimation(parent: checkController, curve: Curves.slowMiddle);
//
// //================================================================================================================
//   late AnimationController scaleController1 =
//       AnimationController(duration: const Duration(seconds: 0), vsync: this);
//   late Animation<double> scaleAnimation1 =
//       CurvedAnimation(parent: scaleController1, curve: Curves.elasticOut);
//   late AnimationController checkController1 =
//       AnimationController(duration: const Duration(seconds: 2), vsync: this);
//   late Animation<double> checkAnimation1 =
//       CurvedAnimation(parent: checkController1, curve: Curves.slowMiddle);
//
// //================================================================================================================
//   late AnimationController scaleController2 =
//       AnimationController(duration: const Duration(seconds: 0), vsync: this);
//   late Animation<double> scaleAnimation2 =
//       CurvedAnimation(parent: scaleController2, curve: Curves.elasticOut);
//   late AnimationController checkController2 =
//       AnimationController(duration: const Duration(seconds: 3), vsync: this);
//   late Animation<double> checkAnimation2 =
//       CurvedAnimation(parent: checkController2, curve: Curves.slowMiddle);
//
// //================================================================================================================
//   late AnimationController scaleController3 =
//       AnimationController(duration: const Duration(seconds: 0), vsync: this);
//   late Animation<double> scaleAnimation3 =
//       CurvedAnimation(parent: scaleController3, curve: Curves.elasticOut);
//   late AnimationController checkController3 =
//       AnimationController(duration: const Duration(seconds: 4), vsync: this);
//   late Animation<double> checkAnimation3 =
//       CurvedAnimation(parent: checkController3, curve: Curves.slowMiddle);
//
//   //================================================================================================================
//   late AnimationController scaleController4 =
//       AnimationController(duration: const Duration(seconds: 0), vsync: this);
//   late Animation<double> scaleAnimation4 =
//       CurvedAnimation(parent: scaleController4, curve: Curves.elasticOut);
//   late AnimationController checkController4 =
//       AnimationController(duration: const Duration(seconds: 5), vsync: this);
//   late Animation<double> checkAnimation4 =
//       CurvedAnimation(parent: checkController4, curve: Curves.slowMiddle);
//
//   //================================================================================================================
//   late AnimationController nextscaleController =
//       AnimationController(duration: const Duration(seconds: 3), vsync: this);
//   late Animation<double> nextscaleAnimation =
//       CurvedAnimation(parent: nextscaleController, curve: Curves.elasticOut);
//   late AnimationController nextcheckController =
//       AnimationController(duration: const Duration(seconds: 5), vsync: this);
//   late Animation<double> nextcheckAnimation =
//       CurvedAnimation(parent: nextcheckController, curve: Curves.elasticOut);
//
//   @override
//   void initState() {
//     super.initState();
//     scaleController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         checkController.forward();
//       }
//     });
//     scaleController1.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         checkController1.forward();
//       }
//     });
//     scaleController2.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         checkController2.forward();
//       }
//     });
//     scaleController3.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         checkController3.forward();
//       }
//     });
//     scaleController4.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         checkController4.forward();
//       }
//     });
//     nextscaleController.addStatusListener((status) {
//       if (status == AnimationStatus.completed) {
//         nextcheckController.forward();
//       }
//     });
//
//     scaleController.forward();
//     scaleController1.forward();
//     scaleController2.forward();
//     scaleController3.forward();
//     scaleController4.forward();
//     Future.delayed(
//       Duration(seconds: 4),
//       () {
//         setState(() {
//           timer = true;
//         });
//       },
//     ).whenComplete(() => button());
//   }
//
//   bool timer = false;
//
//   button() {
//     return Text(
//       'data',
//       style: TextStyle(color: Colors.black),
//     );
//   }
//
//   @override
//   void dispose() {
//     scaleController.dispose();
//     checkController.dispose();
//     scaleController1.dispose();
//     checkController1.dispose();
//     scaleController2.dispose();
//     checkController2.dispose();
//     scaleController3.dispose();
//     checkController3.dispose();
//     scaleController4.dispose();
//     checkController4.dispose();
//     nextscaleController.dispose();
//     nextcheckController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ScreenSize.sizerInit(context);
//     double circleSize = ScreenSize.fSize_20();
//     double iconSize = ScreenSize.fSize_18();
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Stack(
//             children: [
//               Center(
//                 child: ScaleTransition(
//                   scale: scaleAnimation,
//                   child: Container(
//                     height: circleSize,
//                     width: circleSize,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//               SizeTransition(
//                 sizeFactor: checkAnimation,
//                 axis: Axis.horizontal,
//                 axisAlignment: -1,
//                 child: Center(
//                   child: Container(
//                       height: circleSize,
//                       width: circleSize,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.check,
//                           color: Colors.white, size: iconSize)),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Center(
//                 child: ScaleTransition(
//                   scale: scaleAnimation1,
//                   child: Container(
//                     height: circleSize,
//                     width: circleSize,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//               SizeTransition(
//                 sizeFactor: checkAnimation1,
//                 axis: Axis.horizontal,
//                 axisAlignment: -1,
//                 child: Center(
//                   child: Container(
//                       height: circleSize,
//                       width: circleSize,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.check,
//                           color: Colors.white, size: iconSize)),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Center(
//                 child: ScaleTransition(
//                   scale: scaleAnimation2,
//                   child: Container(
//                     height: circleSize,
//                     width: circleSize,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//               SizeTransition(
//                 sizeFactor: checkAnimation2,
//                 axis: Axis.horizontal,
//                 axisAlignment: -1,
//                 child: Center(
//                   child: Container(
//                       height: circleSize,
//                       width: circleSize,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.check,
//                           color: Colors.white, size: iconSize)),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Center(
//                 child: ScaleTransition(
//                   scale: scaleAnimation3,
//                   child: Container(
//                     height: circleSize,
//                     width: circleSize,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//               SizeTransition(
//                 sizeFactor: checkAnimation3,
//                 axis: Axis.horizontal,
//                 axisAlignment: -1,
//                 child: Center(
//                   child: Container(
//                       height: circleSize,
//                       width: circleSize,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.check,
//                           color: Colors.white, size: iconSize)),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               Center(
//                 child: ScaleTransition(
//                   scale: scaleAnimation4,
//                   child: Container(
//                     height: circleSize,
//                     width: circleSize,
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ),
//               SizeTransition(
//                 sizeFactor: checkAnimation4,
//                 axis: Axis.horizontal,
//                 axisAlignment: -1,
//                 child: Center(
//                   child: Container(
//                       height: circleSize,
//                       width: circleSize,
//                       decoration: BoxDecoration(
//                         color: Colors.green,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Icon(Icons.check,
//                           color: Colors.white, size: iconSize)),
//                 ),
//               ),
//             ],
//           ),
//           Stack(
//             children: [
//               SizeTransition(
//                 sizeFactor: scaleAnimation4,
//                 axis: Axis.horizontal,
//                 axisAlignment: -1,
//                 child: Text(
//                   'data',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               )
//             ],
//           ),
//           if (timer == true) ...[
//             Container()
//           ] else ...[
//             Text(
//               'data',
//               style: TextStyle(color: Colors.black),
//             )
//
//           ]
//         ],
//       ),
//     );
//   }
// }

