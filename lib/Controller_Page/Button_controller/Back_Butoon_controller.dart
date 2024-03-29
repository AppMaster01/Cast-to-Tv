// ignore_for_file: avoid_print, invalid_use_of_protected_member, use_build_context_synchronously, camel_case_types, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:developer';

import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';
import '../../media_qury/media_qury.dart';

// final AddButton addButton = Get.put(AddButton());
bool isInterstitialAdLoaded = false;

final BackButtonController backbuttoncontroller =
    Get.put(BackButtonController());

class BackButtonController extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Rx Backbuttoncounter = 1.obs;

  showBackbuttonad(BuildContext context,String name) async {
    if (CastTvData.value["backCounter"] == Backbuttoncounter.value) {
      print(CastTvData.value[name]["Interstitial_Ad_type"]);
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () {
                return Future.value(true);
              },
              child: Center(
                child: AlertDialog(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: ScreenSize.fSize_34(),
                          width: ScreenSize.fSize_34(),
                          child: CircularProgressIndicator()),
                      Text("Ad is loading...",
                          style: TextStyle(fontSize: ScreenSize.fSize_18())),
                    ],
                  ),
                ),
              ));
        },
      );
      if (CastTvData.value[name]["Interstitial_Ad_type"] == 'admob') {
        InterstitialAd.load(
          adUnitId: CastTvData.value[name]["Interstitial_Admob"],
          // adUnitId: "/6499/example/interstitial",
          request: const AdManagerAdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
            ad.show();
            Navigator.pop(context);
            Navigator.pop(context);
            // page != 'stop' ? Navigator.pop(context) : null;
            Backbuttoncounter.value = 1;
          }, onAdFailedToLoad: (error) {
            InterstitialAd.load(
              adUnitId: CastTvData.value["interstitial"],
              // adUnitId: "/6499/example/interstitial",
              request: const AdManagerAdRequest(),
              adLoadCallback: InterstitialAdLoadCallback(onAdLoaded: (ad) {
                ad.show();
                Navigator.pop(context);
                // page != 'stop' ? Navigator.pop(context)  : null;
                Backbuttoncounter.value = 1;
              }, onAdFailedToLoad: (error) {
                Navigator.pop(context);
                Navigator.pop(context);
                // page != 'stop' ? Navigator.pop(context)  : null;
                Backbuttoncounter.value = 1;
              }),
            );
          }),
        );
      }

      if (CastTvData.value[name]["Interstitial_Ad_type"] == 'fb') {
        print("ads loading");
        FacebookInterstitialAd.loadInterstitialAd(
          placementId: CastTvData.value["interstitial_FB"],
          listener: (result, value) async {
            log('Ad Load');
            if (result == InterstitialAdResult.LOADED) {
              await FacebookInterstitialAd.showInterstitialAd();
              Navigator.pop(context);
              Navigator.pop(context);
              // page != 'stop' ? Navigator.pop(context) : null;
              Backbuttoncounter.value = 1;
            }
            if (result == InterstitialAdResult.ERROR) {
              Navigator.pop(context);
              Navigator.pop(context);
              // page != 'stop' ? Navigator.pop(context)  : null;
              Backbuttoncounter.value = 1;
            }
          },
        );
      }
      if (CastTvData.value[name]["Interstitial_Ad_type"] == "url") {
        // log("Loading");
        _launchURL(CastTvData.value[name]["url"]);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pop(context);
            Navigator.pop(context);
            // page != 'stop' ?Navigator.pop(context)  : null;
            Backbuttoncounter.value = 1;
          },
        );
      }
    } else {
      Navigator.pop(context);

      // page != 'stop' ? Navigator.pop(context)  : null;
      Backbuttoncounter.value++;
    }
  }
}
