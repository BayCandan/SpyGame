import 'package:flutter/material.dart';
import 'package:spy/services/google_ads.dart';
import 'package:spy/widgets/rols.dart';


Widget StartGame(BuildContext context){
  
  final GoogleAds googleAds = GoogleAds();
    return Container(
        width: 350,
        height: 500,
        margin: EdgeInsets.only(bottom: 100),
        child: InkWell(
          onTap: () {

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: ((context) => Rols())));
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'Oyun Basladi Casusu Ve Lokasyonu Ogrenemek Icin Dokun',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.black54,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade600,
          borderRadius: BorderRadius.circular(10),
        ),
      );
  }