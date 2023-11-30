// import 'dart:async';
// import 'dart:io';
//
// import 'package:cast_tv/Widget_controllers/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_gallery/photo_gallery.dart';
// import 'package:transparent_image/transparent_image.dart';
// import 'package:video_player/video_player.dart';
//
// import '../../Controller_Page/Button_controller/Back_Butoon_controller.dart';
// import '../../Controller_Page/Button_controller/Main_Controller.dart';
// import '../../Media_Qury/Media_Qury.dart';
//
// class Video_Player extends StatefulWidget {
//   @override
//   _Video_PlayerState createState() => _Video_PlayerState();
// }
//
// class _Video_PlayerState extends State<Video_Player> {
//   List<Album>? _albums;
//   bool _loading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//     initAsync();
//   }
//
//   Future<void> initAsync() async {
//     if (await _promptPermissionSetting()) {
//       List<Album> albums =
//           await PhotoGallery.listAlbums(mediumType: MediumType.image);
//       setState(() {
//         _albums = albums;
//         _loading = false;
//       });
//     }
//     setState(() {
//       _loading = false;
//     });
//   }
//
//   Future<bool> _promptPermissionSetting() async {
//     if (Platform.isIOS &&
//             await Permission.storage.request().isGranted &&
//             await Permission.photos.request().isGranted ||
//         Platform.isAndroid && await Permission.storage.request().isGranted) {
//       return true;
//     }
//     return false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: controllerapp.getbar(() {
//           backbuttoncontroller.showBackbuttonad(context, '/Video_Player');
//         }, 'File Manager', false),
//         body: _loading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : LayoutBuilder(
//                 builder: (context, constraints) {
//                   double gridWidth = (constraints.maxWidth - 20) / 3;
//                   double gridHeight = gridWidth + 33;
//                   double ratio = gridWidth / gridHeight;
//                   return Container(
//                     padding: EdgeInsets.all(5),
//                     child: GridView.count(
//                       childAspectRatio: ratio,
//                       crossAxisCount: 3,
//                       mainAxisSpacing: 5.0,
//                       crossAxisSpacing: 5.0,
//                       children: <Widget>[
//                         ...?_albums?.map(
//                           (album) => GestureDetector(
//                             onTap: () => Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                     builder: (context) => AlbumPage(album))),
//                             child: Column(
//                               children: <Widget>[
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(5.0),
//                                   child: Container(
//                                     color: Colors.grey[300],
//                                     height: gridWidth,
//                                     width: gridWidth,
//                                     child: FadeInImage(
//                                       fit: BoxFit.cover,
//                                       placeholder:
//                                           MemoryImage(kTransparentImage),
//                                       image: AlbumThumbnailProvider(
//                                         albumId: album.id,
//                                         mediumType: album.mediumType,
//                                         highQuality: true,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topLeft,
//                                   padding: EdgeInsets.only(left: 2.0),
//                                   child: Text(
//                                     album.name ?? "Unnamed Album",
//                                     maxLines: 1,
//                                     textAlign: TextAlign.start,
//                                     style: TextStyle(
//                                       height: 1.2,
//                                       fontSize: 16,
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topLeft,
//                                   padding: EdgeInsets.only(left: 2.0),
//                                   child: Text(
//                                     album.count.toString(),
//                                     textAlign: TextAlign.start,
//                                     style: TextStyle(
//                                       height: 1.2,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }
//
// class AlbumPage extends StatefulWidget {
//   final Album album;
//
//   AlbumPage(Album album) : album = album;
//
//   @override
//   State<StatefulWidget> createState() => AlbumPageState();
// }
//
// class AlbumPageState extends State<AlbumPage> {
//   List<Medium>? _media;
//
//   @override
//   void initState() {
//     super.initState();
//     initAsync();
//   }
//
//   void initAsync() async {
//     MediaPage mediaPage = await widget.album.listMedia();
//     setState(() {
//       _media = mediaPage.items;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: controllerapp.getbar(() {
//           Navigator.pop(context);
//         }, widget.album.name ?? "Unnamed Album", false),
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GridView.count(
//             crossAxisCount: 3,
//             mainAxisSpacing: 1.0,
//             crossAxisSpacing: 1.0,
//             children: <Widget>[
//               ...?_media?.map(
//                 (medium) => GestureDetector(
//                   onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => ViewerPage(medium))),
//                   child: Container(
//                     color: Colors.grey[300],
//                     child: FadeInImage(
//                       fit: BoxFit.cover,
//                       placeholder: MemoryImage(kTransparentImage),
//                       image: ThumbnailProvider(
//                         mediumId: medium.id,
//                         mediumType: medium.mediumType,
//                         highQuality: true,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ViewerPage extends StatelessWidget {
//   final Medium medium;
//
//   ViewerPage(Medium medium) : medium = medium;
//
//   @override
//   Widget build(BuildContext context) {
//     DateTime? date = medium.creationDate ?? medium.modifiedDate;
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(15),
//             )),
//             leading: GestureDetector(
//                 onTap: () {
//                   backbuttoncontroller.showBackbuttonad(context, '/ViewerPage');
//                 },
//                 child: Center(
//                     child: Image(
//                   height: ScreenSize.fSize_20(),
//                   image: AssetImage('asset/image/icon/back-icon.png'),
//                 ))),
//             elevation: 0,
//             backgroundColor: Color(0xFF5A3B8B),
//             title: date != null ? Text(date.toLocal().toString()) : null),
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               alignment: Alignment.center,
//               child: medium.mediumType == MediumType.image
//                   ? FadeInImage(
//                       fit: BoxFit.cover,
//                       placeholder: MemoryImage(kTransparentImage),
//                       image: PhotoProvider(mediumId: medium.id),
//                     )
//                   : VideoProvider(
//                       mediumId: medium.id,
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class VideoProvider extends StatefulWidget {
//   final String mediumId;
//
//   const VideoProvider({
//     required this.mediumId,
//   });
//
//   @override
//   _VideoProviderState createState() => _VideoProviderState();
// }
//
// class _VideoProviderState extends State<VideoProvider> {
//   VideoPlayerController? _controller;
//   File? _file;
//
//   @override
//   void initState() {
//     WidgetsBinding.instance?.addPostFrameCallback((_) {
//       initAsync();
//     });
//     super.initState();
//   }
//
//   Future<void> initAsync() async {
//     try {
//       _file = await PhotoGallery.getFile(mediumId: widget.mediumId);
//       _controller = VideoPlayerController.file(_file!);
//       _controller?.initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//     } catch (e) {
//       print("Failed : $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return _controller == null || !_controller!.value.isInitialized
//         ? Container()
//         : Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               AspectRatio(
//                 aspectRatio: _controller!.value.aspectRatio,
//                 child: VideoPlayer(_controller!),
//               ),
//               SizedBox(height: ScreenSize.fSize_20()),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _controller!.value.isPlaying
//                         ? _controller!.pause()
//                         : _controller!.play();
//                   });
//                 },
//                 child: Container(
//                   height: ScreenSize.horizontalBlockSize! * 12,
//                   width: ScreenSize.horizontalBlockSize! * 20,
//                   decoration: BoxDecoration(
//                       color: Color(0xFF5A3B8B),
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                             offset: Offset(0, 2),
//                             color: Colors.black26,
//                             blurRadius: 2)
//                       ]),
//                   child: Icon(
//                     color: Colors.white,
//                     _controller!.value.isPlaying
//                         ? Icons.pause
//                         : Icons.play_arrow,
//                   ),
//                 ),
//               ),
//             ],
//           );
//   }
// }

// ignore_for_file: camel_case_types

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/Media_Qury/Media_Qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';

class page extends StatelessWidget {
  const page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(context, '/page'),
      child: Scaffold(
        backgroundColor: const Color(0xffF9F5FF),
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/page');
        }, 'Select', true),
        body: Stack(
          children: [
            native.getNT('/page', 'listTileMedium'),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: ScreenSize.horizontalBlockSize! * 50),
                  controllerbutton.getbutton(context, () {
                    controller.showbuttonad(context, '/image', '/page', '');
                  }, 'Image'),
                  SizedBox(height: ScreenSize.fSize_30()),
                  controllerbutton.getbutton(context, () {
                    controller.showbuttonad(
                        context, '/Video_Player', '/page', '');
                  }, 'Video'),
                ],
              ),
            ),
            banner.getBN('/page')
          ],
        ),
      ),
    );
  }
}
