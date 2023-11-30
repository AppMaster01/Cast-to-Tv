// ignore_for_file: library_private_types_in_public_api, empty_catches, camel_case_types, prefer_initializing_formals, sized_box_for_whitespace

import 'dart:async';
import 'dart:io';

import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

import '../../Controller_Page/Button_controller/Back_Butoon_controller.dart';
import '../../Media_Qury/Media_Qury.dart';

class Video_Player extends StatefulWidget {
  const Video_Player({super.key});

  @override
  _Video_PlayerState createState() => _Video_PlayerState();
}

class _Video_PlayerState extends State<Video_Player> {
  List<Album>? _albums;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    initAsync();
  }

  Future<void> initAsync() async {
    if (await _promptPermissionSetting()) {
      List<Album> albums =
          await PhotoGallery.listAlbums(mediumType: MediumType.video);
      setState(() {
        _albums = albums;
        _loading = false;
      });
    }
    setState(() {
      _loading = false;
    });
  }

  Future<bool> _promptPermissionSetting() async {
    if (Platform.isIOS &&
            await Permission.storage.request().isGranted &&
            await Permission.photos.request().isGranted ||
        Platform.isAndroid && await Permission.storage.request().isGranted) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/Video_Player'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/Video_Player');
        }, 'File Manager', false),
        body: Stack(
          children: [
            _loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: ListView.custom(
                          childrenDelegate: SliverChildListDelegate([
                            ...?_albums?.map(
                              (album) => GestureDetector(
                                onTap: () {
                                  controller.showbuttonad(
                                      context,
                                      '/videoalbumPage',
                                      '/Video_Player',
                                      album);
                                },
                                // Navigator.of(context).push(
                                // MaterialPageRoute(
                                //     builder: (context) =>
                                //         videoalbumPage(album))),
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: ScreenSize.fSize_10()),
                                        child: Container(
                                          color: const Color(0xffeeeae7),
                                          height:
                                              ScreenSize.horizontalBlockSize! *
                                                  20,
                                          width:
                                              ScreenSize.horizontalBlockSize! *
                                                  150,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Center(
                                                    child: Image(
                                                        width: ScreenSize
                                                            .fSize_50(),
                                                        color: const Color(
                                                            0xffeba505),
                                                        image: const AssetImage(
                                                            'asset/image/icon/folder.png'))),
                                                Text(
                                                  album.name ?? "Unnamed Album",
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.nunito(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ScreenSize.fSize_16(),
                                                  ),
                                                ),
                                                Text(album.count.toString(),
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.poppins(
                                                      color: Colors.black,
                                                      fontSize:
                                                          ScreenSize.fSize_16(),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    },
                  ),
            banner.getBN('/Video_Player')
          ],
        ),
      ),
    );
  }
}
//===================================================================================================================================================================================

class videoalbumPage extends StatefulWidget {
  const videoalbumPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => videoalbumPageState();
}

class videoalbumPageState extends State<videoalbumPage> {
  List<Medium>? _media;

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    MediaPage mediaPage = await album.listMedia();
    setState(() {
      _media = mediaPage.items;
    });
  }

  Album album = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controllerapp.getbar(() {
        backbuttoncontroller.showBackbuttonad(context, '/videoalbumPage');
      }, album.name ?? "Unnamed Album", false),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: ScreenSize.fSize_45()),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: ListView.custom(
                childrenDelegate: SliverChildListDelegate([
                  ...?_media?.map(
                    (medium) => GestureDetector(
                      onTap: () {
                        controller.showbuttonad(context, '/videoViewerPage',
                            '/videoalbumPage', medium);
                      },
                      // Navigator.of(context).push(MaterialPageRoute(
                      // builder: (context) => videoViewerPage(medium))),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenSize.fSize_3()),
                              child: Container(
                                  height: ScreenSize.horizontalBlockSize! * 17,
                                  width: ScreenSize.horizontalBlockSize! * 150,
                                  child: Row(
                                    children: [
                                      Container(
                                        height:
                                            ScreenSize.horizontalBlockSize! *
                                                17,
                                        width: ScreenSize.fSize_50(),
                                        child: FadeInImage(
                                          fit: BoxFit.cover,
                                          placeholder:
                                              MemoryImage(kTransparentImage),
                                          image: ThumbnailProvider(
                                            mediumId: medium.id,
                                            mediumType: medium.mediumType,
                                            highQuality: true,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: ScreenSize.fSize_20()),
                                      Text(medium.filename ?? "Unnamed Album",
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.nunito(
                                            fontWeight: FontWeight.w500,
                                            fontSize: ScreenSize.fSize_16(),
                                          )),
                                    ],
                                  )),
                            ),
                          ),
                          Divider(
                            indent: ScreenSize.fSize_70(),
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
          banner.getBN('/videoalbumPage')
        ],
      ),
    );
  }
}
//===================================================================================================================================================================================

class videoViewerPage extends StatefulWidget {
  const videoViewerPage({super.key});

  @override
  State<videoViewerPage> createState() => _videoViewerPageState();
}

class _videoViewerPageState extends State<videoViewerPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Medium medium = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controllerapp.getbar(() {
        backbuttoncontroller.showBackbuttonad(context, '/videoViewerPage');
      }, medium.title.toString(), false),
      body: Container(
        alignment: Alignment.center,
        child: medium.mediumType == MediumType.image
            ? FadeInImage(
                fit: BoxFit.cover,
                placeholder: MemoryImage(kTransparentImage),
                image: PhotoProvider(mediumId: medium.id),
              )
            : VideoProvider(mediumId: medium.id),
      ),
    );
  }
}
//===================================================================================================================================================================================

class VideoProvider extends StatefulWidget {
  final String mediumId;

  const VideoProvider({
    super.key,
    required this.mediumId,
  });

  @override
  _VideoProviderState createState() => _VideoProviderState();
}

class _VideoProviderState extends State<VideoProvider> {
  VideoPlayerController? _controller;
  File? _file;
  ChewieController? chewieController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();
    chewieController!.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initAsync();
    });
    super.initState();
  }

  Future<void> initAsync() async {
    try {
      _file = await PhotoGallery.getFile(mediumId: widget.mediumId);
      _controller = VideoPlayerController.file(_file!);
      _controller?.initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        chewieController = ChewieController(
            videoPlayerController: _controller!,
            autoPlay: true,
            looping: false,
            materialProgressColors: ChewieProgressColors(
                // playedColor: Colors.red,
                // handleColor: Colors.cyanAccent,
                // backgroundColor: Colors.yellow,
                // bufferedColor: Colors.lightGreen,
                ),
            placeholder: Container(
              color: Colors.greenAccent,
            ),
            autoInitialize: true);
      });
      chewieController?.addListener(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return !chewieController!.isPlaying
        ? CircularProgressIndicator()
        : SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController!,
                    // mediumId: widget.medium.id,
                  ),
                ),
                SizedBox(height: ScreenSize.fSize_10()),
                SizedBox(height: ScreenSize.fSize_10()),
              ],
            ),
          );
  }
}
