import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/page/interim_page.dart';
import 'package:spy/page/card_page.dart';
import 'package:spy/page/test_page.dart';

class PlayerSelection extends StatefulWidget {
  const PlayerSelection({super.key});

  @override
  State<PlayerSelection> createState() => _PlayerSelectionState();
}

int players = 2;


class _PlayerSelectionState extends State<PlayerSelection> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text("Casus",style: TextStyle(color: Colors.white38,fontSize: 24),),
        
        
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "Oyuncu Secimi",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  width: 300,
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Text(
                        '$players',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Slider(
                        activeColor: Colors.black54,
                        inactiveColor: Colors.black26,
                        value: players.toDouble(),
                        onChanged: (newPlayers) {
                          setState(() {
                            players = newPlayers.round();
                            storageBox.write("player", players);
                          });
                        },
                        min: 2,
                        max: 10,
                        divisions: 8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
        
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
                  Get.to(InterimPage());
                
                },
                backgroundColor: Colors.black45,
              )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
    );
  }
}
