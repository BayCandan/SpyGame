import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/page/card_page.dart';
import 'package:spy/page/test_page.dart';
import 'package:spy/widgets/continue_button.dart';

import '../main_page.dart';

class InterimPage extends StatefulWidget {
  
  const InterimPage({super.key});

  @override
  State<InterimPage> createState() => _InterimPageState();
}

class _InterimPageState extends State<InterimPage> {
  final storageBox = GetStorage();
  @override
  Widget build(BuildContext context) {
    ctrl.randomSpyStart();
    ctrl.readList();
    return Scaffold(
      
      backgroundColor: Colors.blueGrey,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Text(
                "OYUNA BASLA",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
 
}
