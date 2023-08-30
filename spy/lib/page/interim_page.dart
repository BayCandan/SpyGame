import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/page/card_page.dart';
import 'package:spy/page/test_page.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(
          "Casus",
          style: TextStyle(color: Colors.white38, fontSize: 24),
        ),
      ),
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
                  Get.to(CardPage());
                
                },
                backgroundColor: Colors.black45,
              )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    
    );
    
  }
 
}
