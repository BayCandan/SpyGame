import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_string/random_string.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/main.dart';
import 'package:spy/services/google_ads.dart';
import 'dart:convert';

import '../widgets/card_image.dart';
import '../widgets/player_and_loc.dart';
import '../widgets/rols.dart';
import '../widgets/spy_card.dart';
import '../widgets/start_game.dart';

final Controller ctrl = Get.find();

class CardPage extends StatefulWidget {
  const CardPage({
    super.key,
  });

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final GoogleAds googleAds = GoogleAds();
  List items = storageBox.read('List');
  int itemsLenght = storageBox.read('locLength');
  int players = storageBox.read("player");
  late int mapIndex = randomBetween(0, itemsLenght-1);
  late int spy = storageBox.read("spy");
  int front = 0;
  int oyunSonu = 0;
  int nowPlayers = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl.randomSpyGame();
    print(itemsLenght);
    googleAds.loadInterstitialAd();
    googleAds.loadBannerAd();
    googleAds.loadRewAd();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    storageBox.write('mapIndex', mapIndex);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Casus",
          style: TextStyle(color: Colors.white38, fontSize: 24),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: googleAds.bannerAd != null
                    ? SizedBox(
                        width: googleAds.bannerAd!.size.width.toDouble(),
                        height: googleAds.bannerAd!.size.height.toDouble(),
                        child: AdWidget(ad: googleAds.bannerAd!),
                      )
                    : Container()),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                  child: Expanded(
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            press();
                          });
                        },
                        child: isFront(front)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  dynamic isFront(front) {
    if (front % 2 == 0 && nowPlayers <= players + 1) {
      oyunSonu = 0;
      return CardImage();
    } else if (front % 2 == 1 && nowPlayers != spy && nowPlayers <= players) {
      oyunSonu = 0;
      return PlayerAndLoc(
        nowPlayers,
        items,
      );
    } else if (nowPlayers <= players) {
      oyunSonu = 0;
      return SpyCard(nowPlayers);
    } else {
      if (oyunSonu == 0) {
        // googleAds.showInterstitialAd();
        googleAds.showRewAd();
        return StartGame(context);
      } else {}
      oyunSonu = 1;
      return Rols();
    }
  }

  void press() {
    cardFlip();

    // print(spy);

    front++;
    nowPlayersPlus();
    ctrl.readJson();
  }

  void cardFlip() {
    Random random = Random();

    int cardValue = random.nextInt(13);
    front % 2 == 0 ? (front = 0) : front = 1;
  }

  void nowPlayersPlus() {
    if (front % 2 == 0) {
      nowPlayers++;
    }
  }
}
