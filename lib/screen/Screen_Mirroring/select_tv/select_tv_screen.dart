import 'package:cast_tv/Controller_Page/Button_controller/Back_Butoon_controller.dart';
import 'package:cast_tv/Controller_Page/Google_Ads.dart';
import 'package:cast_tv/media_qury/media_qury.dart';
import 'package:cast_tv/Widget_controllers/controller.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class select_tv extends StatelessWidget {
  const select_tv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>
          backbuttoncontroller.showBackbuttonad(context, '/select_tv'),
      child: Scaffold(
          appBar: controllerapp.getbar(() {
            backbuttoncontroller.showBackbuttonad(context, '/select_tv');
          }, 'Select TV', true),
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: ScreenSize.fSize_20()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controllersmall.getsmall(
                        context,
                        'Sony',
                      ),
                      controllersmall.getsmall(
                        context,
                        'Samsung',
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controllersmall.getsmall(
                        context,
                        'LG',
                      ),
                      controllersmall.getsmall(
                        context,
                        'Panasonic',
                      ),
                    ],
                  ),
                  native.getNT('/select_tv', 'listTileMedium'),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controllersmall.getsmall(
                        context,
                        'Toshiba',
                      ),
                      controllersmall.getsmall(
                        context,
                        'Mi',
                      ),
                    ],
                  ),
                  SizedBox(height: ScreenSize.fSize_20()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controllersmall.getsmall(
                        context,
                        'One Plus TCL',
                      ),
                      controllersmall.getsmall(
                        context,
                        'Others',
                      ),
                    ],
                  ),
                ],
              ),
              banner.getBN('/select_tv')
            ],
          )),
    );
  }
}
