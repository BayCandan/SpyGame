import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Controller extends GetxController {
  late BuildContext context;
  Controller({required this.context});


  jsonOku() async {
      // List locasyonListesi = [];

    String readString =
        await DefaultAssetBundle.of(context).loadString("assets/location.json");

    var jsonObject = jsonDecode(readString);
    List locationList = jsonObject;

    print(locationList[1]["loc"]);
    // locasyonListesi.remove(0);
    // print(locasyonListesi[0]);
  }
}