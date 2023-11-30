// ignore_for_file: library_private_types_in_public_api, camel_case_types, prefer_initializing_formals, sized_box_for_whitespace, empty_catches

import 'dart:async';
import 'dart:io';

import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_gallery/photo_gallery.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:video_player/video_player.dart';

import '../../Controller_Page/Button_controller/Main_Controller.dart';
import '../../Media_Qury/Media_Qury.dart';
import '../../Widget_controllers/controller.dart';

class image extends StatefulWidget {
  const image({Key? key}) : super(key: key);

  @override
  _imageState createState() => _imageState();
}

class _imageState extends State<image> {
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
          await PhotoGallery.listAlbums(mediumType: MediumType.image);
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
      onWillPop: () => backbuttoncontroller.showBackbuttonad(context, '/image'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/image');
        }, 'File Manager', false),
        body: Stack(
          children: [
            _loading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Color(0xff5A3B8B),
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      // double gridWidth = (constraints.maxWidth - 20) / 3;
                      // double gridHeight = gridWidth + 33;
                      // double ratio = gridWidth / gridHeight;
                      return Container(
                        padding: const EdgeInsets.all(8),
                        child: ListView.custom(
                          // childAspectRatio: ratio,
                          // crossAxisCount: 1,
                          // mainAxisSpacing: 5.0,
                          // crossAxisSpacing: 5.0,
                          childrenDelegate: SliverChildListDelegate([
                            ...?_albums?.map(
                              (album) => GestureDetector(
                                onTap: () {
                                  controller.showbuttonad(
                                      context, '/AlbumPage', '/image', album);
                                },
                                // Navigator.of(context).push(
                                // MaterialPageRoute(
                                //     builder: (context) => AlbumPage(album))),
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: ScreenSize.fSize_10()),
                                        child: Container(
                                            color: const Color(0xffeeeae7),
                                            height:
                                                ScreenSize.horizontalBlockSize! *
                                                    20,
                                            width: ScreenSize.horizontalBlockSize! *
                                                150,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Center(
                                                      child: Image(
                                                          width:
                                                              ScreenSize.fSize_50(),
                                                          color: const Color(
                                                              0xffeba505),
                                                          image: const AssetImage(
                                                              'asset/image/icon/folder.png'))),
                                                  // FadeInImage(
                                                  //   fit: BoxFit.cover,
                                                  //   placeholder: MemoryImage(
                                                  //       kTransparentImage),
                                                  //   image: AlbumThumbnailProvider(
                                                  //     albumId: album.id,
                                                  //     mediumType:
                                                  //         album.mediumType,
                                                  //     highQuality: true,
                                                  //   ),
                                                  // ),

                                                  Text(
                                                    album.name ?? "Unnamed Album",
                                                    maxLines: 1,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.nunito(
                                                      color: Colors.black,
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
                                            )),
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
            banner.getBN('/image')
          ],
        ),
      ),
    );
  }
}

//===================================================================================================================================================================================
class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AlbumPageState();
}

class AlbumPageState extends State<AlbumPage> {
  Album album = Get.arguments;
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/AlbumPage'),
      child: Scaffold(
        appBar: controllerapp.getbar(() {
          backbuttoncontroller.showBackbuttonad(context, '/AlbumPage');
        }, album.name ?? "Unnamed Album", false),
        body: Stack(
          children: [
            banner.getBN('/AlbumPage'),
            Padding(
              padding:  EdgeInsets.only(bottom: ScreenSize.fSize_45()),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: ListView.custom(
                  childrenDelegate: SliverChildListDelegate([
                    ...?_media?.map(
                      (medium) => GestureDetector(
                        onTap: () {
                          controller.showbuttonad(
                              context, '/ViewerPage', '/AlbumPage', medium);
                        },
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: ScreenSize.fSize_3()),
                                child: Container(
                                    height: ScreenSize.horizontalBlockSize! * 17,
                                    width: ScreenSize.horizontalBlockSize! * 150,
                                    child: Column(
                                      children: [
                                        Row(
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
                                            // ignore: avoid_unnecessary_containers
                                            Container(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      medium.filename ??
                                                          "Unnamed Album",
                                                      textAlign: TextAlign.start,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.nunito(
                                                        fontWeight: FontWeight.w500,
                                                        fontSize:
                                                            ScreenSize.fSize_16(),
                                                      )),
                                                  Text(medium.creationDate.toString(),
                                                      textAlign: TextAlign.start,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: GoogleFonts.nunito(
                                                        fontWeight: FontWeight.w300,
                                                        fontSize:
                                                            ScreenSize.fSize_12(),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
          ],
        ),
      ),
    );
  }
}

//==================================================================================================================================================================================
class ViewerPage extends StatelessWidget {
  ViewerPage({super.key});

  Medium medium = Get.arguments;

  @override
  Widget build(BuildContext context) {
    DateTime? date = medium.creationDate ?? medium.modifiedDate;
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/ViewerPage'),
      child: Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          )),
          leading: GestureDetector(
              onTap: () {
                backbuttoncontroller.showBackbuttonad(context, '/ViewerPage');
              },
              child: Center(
                  child: Image(
                height: ScreenSize.fSize_20(),
                image: const AssetImage('asset/image/icon/back-icon.png'),
              ))),
          elevation: 0,
          backgroundColor: const Color(0xFF5A3B8B),
          title: Text(medium.title.toString()),
        ),
        body: Container(
          alignment: Alignment.center,
          child: medium.mediumType == MediumType.image
              ? FadeInImage(
                  fit: BoxFit.cover,
                  placeholder: MemoryImage(kTransparentImage),
                  image: PhotoProvider(mediumId: medium.id),
                )
              : VideoProvider(
                  mediumId: medium.id,
                ),
        ),
      ),
    );
  }
}

//= ===============================================================================================================================================================================
class VideoProvider extends StatefulWidget {
  final String mediumId;

  const VideoProvider({
    super.key,
    required this.mediumId,
  });

  @override
  _VideoProviderState createState() => _VideoProviderState();
}

//==================================================================================================================================================================================
class _VideoProviderState extends State<VideoProvider> {
  VideoPlayerController? _controller;
  File? _file;

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
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return _controller == null || !_controller!.value.isInitialized
        ? Container()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controller!.value.isPlaying
                        ? _controller!.pause()
                        : _controller!.play();
                  });
                },
                child: Icon(
                  _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ],
          );
  }
}
