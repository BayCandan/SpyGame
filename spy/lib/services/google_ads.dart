import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds {
  int rew = 0;
  InterstitialAd? interstitialAd;
  BannerAd? bannerAd;
  RewardedAd? rewardedAd;

  

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? dotenv.get("INTERSTITIAL_ANDROID", fallback: "")
      : dotenv.get("INTERSTITIAL_IOS", fallback: "");

  final adBannerUnitId = Platform.isAndroid
      ? dotenv.get("BANNER_ANDROID", fallback: "")
      : dotenv.get("BANNER_IOS", fallback: "");

  final adRewUnitId = Platform.isAndroid
      ? dotenv.get("REWARDED_ANDROID", fallback: "")
      : dotenv.get("REWARDED_IOS", fallback: "");

  /// Loads an interstitial ad.
  void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  void showInterstitialAd() {
    if (interstitialAd != null) {
      interstitialAd!.show();
    }
  }

  void loadBannerAd() {
    bannerAd = BannerAd(
      adUnitId: adBannerUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  void loadRewAd() {
    RewardedAd.load(
        adUnitId: adRewUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedAd failed to load: $error');
          },
        ));
  }

  void showRewAd() {
    if (rewardedAd != null) {
      print(rew);

      rewardedAd!.show(onUserEarnedReward: ((ad, reward) => rew++));
      print(rew);
    }
  }
}
