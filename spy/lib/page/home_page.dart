import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/main_page.dart';
import 'package:spy/page/player_selection_page.dart';
import 'package:spy/page/test_page.dart';

import '../widgets/continue_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ctrl.readJson();
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 130),
              width: 225,
              height: 225,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(30),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/card_icon.png"),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              width: double.maxFinite,
              height: 60,
              child: const Center(
                  child: Text("Casus",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50))),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              height: 60,
              child: const Center(
                child: Text(
                  "Kendini Dedektif gibi hissetmekten ve yalancilari bulmaktan hoslananlar icin bir oyun",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // ContinueButton(const PlayerSelection())
        ],
      ),
    );
  }
}
