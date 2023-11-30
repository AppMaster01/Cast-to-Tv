// ignore_for_file: camel_case_types, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cast_tv/Controller_Page/Button_controller/Main_Controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/Media_Qury/Media_Qury.dart';
import 'package:cast_tv/screen/remote_control_screen/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Controller_Page/Button_controller/Back_Butoon_controller.dart';
import '../../Widget_controllers/controller.dart';

class choose_tv_brand_screen extends StatefulWidget {
  const choose_tv_brand_screen({Key? key}) : super(key: key);

  @override
  State<choose_tv_brand_screen> createState() => _choose_tv_brand_screenState();
}

class _choose_tv_brand_screenState extends State<choose_tv_brand_screen> {
  List<SearchModel> search = remoteController.ACname;

  @override
  initState() {
    super.initState();
  }

  void searchlist(String query) {
    final suggetion = remoteController.ACname.where((name) {
      final searchtitle = name.name.toLowerCase();
      final input = query.toLowerCase();

      return searchtitle.contains(input);
    }).toList();
    setState(() => search = suggetion);
  }


  @override
  Widget build(BuildContext context) {
    ScreenSize.sizerInit(context);

    return WillPopScope(
      onWillPop: () => backbuttoncontroller.showBackbuttonad(
          context, '/choose_tv_brand_screen'),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: controllerapp.getbar(() {
            backbuttoncontroller.showBackbuttonad(
                context, '/choose_tv_brand_screen');
          }, 'Choose TV Brand', true),
          body: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: ScreenSize.fSize_60()),
                    Container(
                      height: ScreenSize.horizontalBlockSize! * 164,
                      width: ScreenSize.fSize_350(),
                      color: Colors.transparent,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Column(
                            children: [
                             search.isNotEmpty
                                  ? ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: search.length,
                                      itemBuilder: (context, index) {
                                        final abc = search[index];
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              top: ScreenSize.fSize_23(),
                                              left: ScreenSize.fSize_6(),
                                              right: ScreenSize.fSize_3()),
                                          child: GestureDetector(
                                            onTap: () {
                                              remoteController.adremote(
                                                  remoteController.ACname[index].name,
                                                  remoteController.searchcontroller.text);
                                              controller.showbuttonad(
                                                context,
                                                '/TV_remote_screen',
                                                '/choose_tv_brand_screen',
                                                abc.name,
                                              );
                                            },
                                            child: Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      height:
                                                          ScreenSize.fSize_30(),
                                                      width:
                                                          ScreenSize.fSize_30(),
                                                      decoration: BoxDecoration(
                                                          color: const Color(
                                                              0xffEADFFA),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          boxShadow: const [
                                                            BoxShadow(
                                                                offset: Offset(
                                                                    0, 2),
                                                                color: Colors
                                                                    .black26,
                                                                blurRadius: 2)
                                                          ]),
                                                      child: Center(
                                                          child: Image(
                                                              height: ScreenSize
                                                                  .fSize_20(),
                                                              image: const AssetImage(
                                                                  'asset/image/icon/remote-control-icon.png')))),
                                                  Container(
                                                    width:
                                                        ScreenSize.fSize_70(),
                                                    height:
                                                        ScreenSize.fSize_20(),
                                                    // color: Colors.black12,
                                                    child: Text(
                                                      abc.name,
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 13),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                      width: ScreenSize
                                                              .horizontalBlockSize! *
                                                          39),
                                                  const Icon(
                                                      Icons.navigate_next),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : Text(
                                      'No results found Please try with diffrent search',
                                      style: TextStyle(
                                          fontSize: ScreenSize.fSize_13()),
                                    ),
                              SizedBox(height: ScreenSize.fSize_50()),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: ScreenSize.fSize_60()),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color(0xFFF9F5FF),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0.5, 3),
                              color: Colors.black26,
                              blurRadius: 2)
                        ]),
                    child: TextField(
                      onChanged: (value) => searchlist(value),
                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search_rounded,
                              color: const Color(0xFF5A3B8B),
                              size: ScreenSize.fSize_23()),
                          hintText: "Search For TV Brand",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: ScreenSize.fSize_15()),
                          hintStyle: GoogleFonts.georama(
                              fontSize: ScreenSize.fSize_13(),
                              fontWeight: FontWeight.w400),
                          filled: true,
                          fillColor: Colors.transparent,
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: const BorderSide())),
                    ),
                  ),
                ),
              ),
              banner.getBN('/choose_tv_brand_screen')
            ],
          ),
        ),
      ),
    );
  }
}

// final List<Map<String, dynamic>> allUsers = [
//   {"name": "Acer"},
//   {"name": "Aiwa"},
//   {"name": "Akai "},
//   {"name": "Aoc"},
//   {"name": "Audiovox"},
//   {"name": "Bose"},
//   {"name": "Bush"},
//   {"name": "Coby"},
//   {"name": "Condor"},
//   {"name": "Dynex"},
//   {"name": "Element"},
//   {"name": "Emerson"},
//   {"name": "Funai"},
//   {"name": "Haier"},
//   {"name": "Hisense"},
//   {"name": "Hitachi"},
//   {"name": "Hyundai"},
//   {"name": "Insignia"},
//   {"name": "Jensen"},
//   {"name": "Kenwood"},
//   {"name": "LG"},
//   {"name": "Logik"},
//   {"name": "Magnavox"},
//   {"name": "Mascom"},
//   {"name": "Medion"},
//   {"name": "Micromax"},
//   {"name": "Mitsubishi"},
//   {"name": "Mystery"},
//   {"name": "NEC"},
//   {"name": "Nexus"},
//   {"name": "Nikai"},
//   {"name": "Noblex"},
//   {"name": "Olevia"},
//   {"name": "Onida"},
//   {"name": "Orion"},
//   {"name": "Palsonic"},
//   {"name": "Panasonic"},
//   {"name": "Philco"},
//   {"name": "Philips"},
//   {"name": "Pioneer"},
//   {"name": "Polaroid"},
//   {"name": "Polytron"},
//   {"name": "Prima"},
//   {"name": "Promac"},
//   {"name": "Proscan"},
//   {"name": "Proton"},
//   {"name": "Rubin"},
//   {"name": "Samsung"},
//   {"name": "Samsung Smart"},
//   {"name": "Sansui"},
//   {"name": "Sanyo"},
//   {"name": "Scott"},
//   {"name": "Seiki"},
//   {"name": "Sharp"},
//   {"name": "Singer"},
//   {"name": "Sinotec"},
//   {"name": "Skyworth"},
//   {"name": "Sony"},
//   {"name": "Supra"},
//   {"name": "Swisstec"},
//   {"name": "Sylvania"},
//   {"name": "Symphonic"},
//   {"name": "TCL"},
//   {"name": "Technical"},
//   {"name": "Thomson"},
//   {"name": "Tokai"},
//   {"name": "Toshiba"},
//   {"name": "TurboX"},
//   {"name": "Upstar"},
//   {"name": "Venturer"},
//   {"name": "Veon"},
//   {"name": "Videocon"},
//   {"name": "Viore"},
//   {"name": "Vizio"},
//   {"name": "Voxson"},
//   {"name": "Westinghouse"},
//   {"name": "Multi TV"},
//   {"name": "SFR"},
//   {"name": "Start Times"},
//   {"name": "Total Play"},
//   {"name": "Trend"},
// ];
