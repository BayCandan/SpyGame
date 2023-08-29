import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/main.dart';
import 'dart:convert';

import '../main_page.dart';
import '../widgets/card_image.dart';
import '../widgets/player_and_loc.dart';
import '../widgets/rols.dart';
import '../widgets/spy_card.dart';
import '../widgets/start_game.dart';


class CardPage extends StatefulWidget {
  const CardPage({
    super.key,
  });

  @override
  State<CardPage> createState() => _CardPageState();
}
// final Controller ctrl = Get.find();
class _CardPageState extends State<CardPage> {
  List items = storageBox.read('List');
  int itemsLenght = storageBox.read('locLength');
  int players = storageBox.read("player");
  late int mapIndex = randomBetween(0, itemsLenght);
  late bool oyunsonu = ctrl.oyunsonu;
  late int spy = storageBox.read("spy");
  int front = 0;
  int nowPlayers = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ctrl.randomSpyGame();
    print(itemsLenght);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    storageBox.write('mapIndex', mapIndex);
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
      return CardImage();
    } else if (front % 2 == 1 && nowPlayers != spy && nowPlayers <= players) {
      return PlayerAndLoc(
        nowPlayers,
        items,
      );
    } else if (nowPlayers <= players) {
      return SpyCard(nowPlayers);
    } else {
      return StartGame(context);
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