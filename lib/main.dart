import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reels_downloader/screens/splash/splash.dart';
import 'package:reels_downloader/utils/preferences/preference_manager.dart';

void main() async {
  await GetStorage.init();
  // await Permission.storage.isDenied.then((value) => Permission.storage.request());
  await AppPreference().initialAppPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reels Downloader',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Ageo',
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}
