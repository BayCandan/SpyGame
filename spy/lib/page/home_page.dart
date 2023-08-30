import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/page/player_selection_page.dart';
import 'package:spy/page/test_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(context: context));
    // controller.readJson();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Casus",
          style: TextStyle(color: Colors.white38, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: (){
              Get.to(const TestPage());
            }
          ),
        ],
      ),
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
        ],
      ),
      floatingActionButton: 
          Container(
              height: 100,
              width: 100,
              child: FloatingActionButton(
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 40,
                ),
                onPressed: () {
                  Get.to(PlayerSelection());
                
                },
                backgroundColor: Colors.black45,
              )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  
  }

