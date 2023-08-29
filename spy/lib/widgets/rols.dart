import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/getx_controller.dart';
import '../page/card_page.dart';

class Rols extends StatefulWidget {
  const Rols({super.key});

  @override
  State<Rols> createState() => _RolsState();
}

class _RolsState extends State<Rols> {
  @override
  Widget build(BuildContext context) {
    final storageBox = GetStorage();
    var mapIndex = storageBox.read('mapIndex');
    print('$mapIndex+ mapindex');
    var locList = storageBox.read('List');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black38,
        title: Text(
          "Casus",
          style: TextStyle(color: Colors.white38, fontSize: 24),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 350,
              height: 500,
              margin: EdgeInsets.only(bottom: 100),
              child: Center(
                child: InkWell(
                  onTap: () {
                    ctrl.locDelete(mapIndex);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: ((context) => CardPage())));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Casus",
                        style: TextStyle(fontSize: 35, color: Colors.black54),
                      ),
                      Text(
                        "Oyuncu " + storageBox.read('spy').toString(),
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      Text(
                        'Lokasyon',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        locList[mapIndex],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Divider(),
                      Text(
                        'Yeniden Baslamak Icin Dokun',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade600,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
