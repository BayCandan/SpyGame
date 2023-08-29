import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spy/main_page.dart';
import 'package:spy/page/home_page.dart';
import 'package:spy/theme.dart';

import 'controller/getx_controller.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}
Future<void> diinit(context) async {
    final controller = Get.put(Controller(context: context));
 
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    diinit(context);
    return GetMaterialApp(
      theme: spyThemeData,
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
