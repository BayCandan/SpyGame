import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spy/page/player_selection_page.dart';
import 'package:spy/page/test_page.dart';


Widget ContinueButton(screen) {
  return Expanded(
    child: Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 50),
      child: InkWell(
        onTap: () { Get.to(screen);
       },
        child: Container(
          

          height: 80,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(

            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                "DEVAM ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white38),
              ),
              Icon(
                Icons.play_arrow,
                color: Colors.white38,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
