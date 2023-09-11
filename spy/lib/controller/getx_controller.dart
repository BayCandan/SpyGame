import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:random_string/random_string.dart';

final storageBox = GetStorage();

class Controller extends GetxController {
  late BuildContext context;
  Controller({required this.context});
  bool oyunsonu = false;
  int count = 0;

  readJson() async {
    String readString =
        await DefaultAssetBundle.of(context).loadString("assets/location.json");

    var jsonObject = jsonDecode(readString);
    List locationList = jsonObject;

    await storageBox.write('locLength', locationList.length);
    return locationList;
  }

  randomSpyStart() async {
    int spy = await randomBetween(1, storageBox.read("player"));
    await storageBox.write('spy', spy);
    print('randomSpyStart Calsititirldi');
  }

  randomSpyGame() async {
    var spyTest = await storageBox.read('spy');
    int spy = await randomBetween(1, storageBox.read("player"));
    if (spyTest == spy) {
      randomSpyGame();
    } else {
      await storageBox.write('spy', spy);
    }
    print('randomSpyGame Calsititirldi');
  }

  readList() async {
    List locListEnd = [];
    List locList = await readJson();
    for (var i = 0; i < locList.length;) {
      locListEnd.add(locList[i]['loc']);
      i++;
    }
    storageBox.write('List', locListEnd);
  }

  locDelete(int i) async {
    List locList = await storageBox.read('List');
    await locList.removeAt(i);
    await storageBox.write('List', locList);
    int locLength = locList.length;
    await storageBox.write('locLength', locLength);
  }
  // oyunSonuChange()async{
  //   oyunsonu = await !oyunsonu;
  //   print("Change");
  //   print(oyunsonu);
  // }



}
