import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/6300978111';

  static String get interstitialUnitId => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/1033173712'
      : 'ca-app-pub-3940256099942544/1033173712';

   InterstitialAd? _interstitialAd;

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    BannerAd ad = new BannerAd(
      size: AdSize.banner,
      adUnitId: bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) => print("Ad opened"),
        onAdFailedToLoad: (Ad ad, error) {
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('Ad Opened'),
        onAdClosed: (Ad ad) => print('On Ad Closed'),
      ),
      request: AdRequest(),
    );
    return ad;
  }

  // static createInterstitialAd() {
  //   InterstitialAd.load(
  //       adUnitId: interstitialUnitId,
  //       request: AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         onAdLoaded: (InterstitialAd ad) {
  //           // Keep a reference to the ad so you can show it later.
  //           _interstitialAd = ad;
  //         },
  //         onAdFailedToLoad: (LoadAdError error) {
  //           print('InterstitialAd failed to load: $error');
  //         },
  //       ));
  // }

}
