import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:spy/controller/getx_controller.dart';
import 'package:spy/page/card_page.dart';
import 'package:spy/page/test_page.dart';

import '../services/google_ads.dart';

class InterimPage extends StatefulWidget {
  
  const InterimPage({super.key});

  @override
  State<InterimPage> createState() => _InterimPageState();
}

class _InterimPageState extends State<InterimPage> {
  final storageBox = GetStorage();
  final GoogleAds googleAds = GoogleAds();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleAds.loadBannerAd();
  }
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
            Container(
              child: googleAds.bannerAd != null
                  ? SizedBox(
                      width: googleAds.bannerAd!.size.width.toDouble(),
                      height: googleAds.bannerAd!.size.height.toDouble(),
                      child: AdWidget(ad: googleAds.bannerAd!),
                    )
                  : Container()),
            SizedBox(
              height: 50,
            ),
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Text(
                "NASIL OYNANIR",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black54,
                ),
              ),
            ),
            Center(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              width: 400,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(5),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/how_to_play.png"),
                ),
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
