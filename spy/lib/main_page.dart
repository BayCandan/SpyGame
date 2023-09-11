import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/page/card_page.dart';
import 'package:spy/page/home_page.dart';
import 'package:spy/page/interim_page.dart';
import 'package:spy/page/player_selection_page.dart';
import 'package:spy/page/test_page.dart';
import 'package:spy/widgets/rols.dart';

import '../widgets/continue_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

final Controller ctrl = Get.find();

class _MainPageState extends State<MainPage> {
  int count = ctrl.count;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Casus",
          style: TextStyle(color: Colors.white38, fontSize: 24),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.add_alert),
              onPressed: () {
                Get.to(const TestPage());
              }),
        ],
      ),
      body: showPage(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {});
                  count = 0;
                  print(count);
                })
          ],
        ),
      ),
      floatingActionButton:

          //  /*
          count == 3
              ? Container(
                  height: 100,
                  width: 100,
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.add,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {});
                      count++;
                      print(count);
                    },
                    backgroundColor: Colors.black45,
                  ))
              :
              // */
              Container(
                  height: 100,
                  width: 100,
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      size: 40,
                    ),
                    onPressed: () {
                      setState(() {});
                      count++;
                      print(count);
                    },
                    backgroundColor: Colors.black45,
                  )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  showPage() {
    if (count == 0) {
      setState(() {});
      return HomePage();
    } else if (count == 1) {
      setState(() {});
      return PlayerSelection();
    } else if (count == 2) {
      setState(() {});
      return InterimPage();
    } else if (count == 3) {
      setState(() {});
      return CardPage();
    } else if (count == 4) {
      return Rols();
    } else if (count == 5) ;
    setState(() {});
    count = 3;
    return CardPage();
  }
}
