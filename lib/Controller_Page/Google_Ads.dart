// ignore_for_file: invalid_use_of_protected_member

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../media_qury/media_qury.dart';

final native = Get.put(NativeAds());
final banner = Get.put(BannerAds());

void initState() {
  FacebookAudienceNetwork.init();
}

class NativeAds extends GetxController {
  Future<void> _launchURL(String url) async {
    late Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  Widget getNT(String name, String Factoryid) {
    late NativeAd nativeAd;
    var isLoaded = false.obs;
    if (CastTvData.value[name]["native_Ad_type"] == "admob") {
      nativeAd = NativeAd(
        request: const AdManagerAdRequest(),
        adUnitId: CastTvData.value[name]["native_Admob"],
        listener: NativeAdListener(onAdLoaded: (ad) {
          nativeAd.load();
          isLoaded.value = true;
          print("Banner ad Loaded");
        }, onAdFailedToLoad: (ad, error) {
          print("Banner ad Failed to Load");
        }),
        // factoryId: 'listTileMedium',
        factoryId: Factoryid,
      );
      nativeAd.load();
    }
    // ScreenSize.fSize_150()
    return CastTvData.value[name]["native_Ad_type"] == "admob"
        ? Obx(() => isLoaded.value
            ? Factoryid == "listTile"
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Container(
                          height: ScreenSize.fSize_150(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              )
                            ],
                          ),
                          child: AdWidget(
                            ad: nativeAd,
                          ),
                          // color: Colors.blue,
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Stack(
                      children: [
                        Container(
                          width: ScreenSize.fSize_340(),
                          height: ScreenSize.fSize_250(),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              )
                            ],
                          ),
                          child: AdWidget(
                            ad: nativeAd,
                          ),
                          // color: Colors.blue,
                        ),
                      ],
                    ),
                  )
            : Factoryid == "listTileMedium"
                ? Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: ScreenSize.fSize_340(),
                      height: ScreenSize.fSize_250(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      width: ScreenSize.fSize_340(),
                      height: ScreenSize.fSize_150(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ))
        : CastTvData.value[name]["native_Ad_type"] == "fb"
            ? Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  width: ScreenSize.fSize_350(),
                  height: Factoryid == "listTile"
                      ? ScreenSize.fSize_150()
                      : ScreenSize.fSize_250(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: FacebookNativeAd(
                    placementId: CastTvData.value["native_FB"],
                    adType: NativeAdType.NATIVE_AD,
                    width: ScreenSize.fSize_350(),
                    height: Factoryid == "listTile"
                        ? ScreenSize.fSize_150()
                        : ScreenSize.fSize_250(),
                    backgroundColor: Colors.white,
                    titleColor: Colors.black,
                    descriptionColor: Colors.grey,
                    buttonColor: Color(0xFF5A3B8B),
                    buttonTitleColor: Colors.white,
                    buttonBorderColor: Color(0xFFD88DFA),
                    listener: (result, value) {
                      print("Native Ad: $result --> $value");
                    },
                    keepExpandedWhileLoading: true,
                    expandAnimationDuraion: 1000,
                  ),
                ),
            )
            : GestureDetector(
                onTap: () {
                  _launchURL(CastTvData.value[name]["url"]);
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        width: ScreenSize.fSize_340(),
                        height: Factoryid == "listTile"
                            ? ScreenSize.fSize_150()
                            : ScreenSize.fSize_250(),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  CastTvData.value[name]["image_Url"]),
                              fit: BoxFit.fill),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: ScreenSize.fSize_12(),
                      left: ScreenSize.fSize_12(),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xFF26A4FB),
                            borderRadius: BorderRadius.circular(5)),
                        height: ScreenSize.fSize_15(),
                        width: ScreenSize.fSize_25(),
                        child: Center(
                          child: Text('Ad',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenSize.fSize_10())),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}

//======================================FACEBOOK BANNER===================================================

class BannerAds extends GetxController {
  BannerAd? bannerAd;
  var bannerLoaded = false.obs;

  Widget getBN(String name) {
    bannerAd = BannerAd(
      size: AdSize.fluid,
      adUnitId: CastTvData.value[name]["banner_Admob"],
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            bannerAd!.load();
            bannerLoaded.value = true;
            print("Banner ad Loaded");
          },
          onAdFailedToLoad: (ad, error) {}),
      request: const AdRequest(),
    );
    bannerAd!.load();
    // bannerLoaded.value = true;

    return CastTvData.value[name]["banner_Ad_type"] == "admob"
        ? Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 50,
              child: AdWidget(
                ad: bannerAd!,
              ),
            ),
          )
        : Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              child: FacebookBannerAd(
                placementId: CastTvData.value["banner_FB"],
                bannerSize: BannerSize.STANDARD,
                listener: (result, value) {},
              ),
            ),
          );
  }
}
