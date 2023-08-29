import 'package:flutter/material.dart';

Widget CardImage(){
  return Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 500,
                margin: EdgeInsets.only(bottom: 100),
                child: Image(
                  image: AssetImage("assets/card_icon.png"),
                ),
              );
  }


