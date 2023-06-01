import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_downloader/screens/downloads/DownloadedList.dart';
import 'package:reels_downloader/screens/reels_copy_paste/reels_copy_paste.dart';
import 'package:reels_downloader/screens/home/common_home_container..dart';
import 'package:reels_downloader/utils/constants.dart';
import 'package:reels_downloader/utils/custom_ad_widget.dart';
import 'package:reels_downloader/utils/launch_url.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(children: const [
            Text(
              'Reels ',
              style: TextStyle(
                  color: Colors.pinkAccent, fontWeight: FontWeight.bold),
            ),
            Text(
              'Downloader ',
              style: TextStyle(
                  color: Colors.purpleAccent, fontWeight: FontWeight.bold),
            ),
          ])),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              CommonHomeContainer(
                  onTap: () => Get.to(const ReelsCopyPastePage()),
                  img: "assets/images/instagram.png",
                  text: "Reels Download"),
              const SizedBox(height: 25),
              CommonHomeContainer(
                  onTap: () => Get.to(const DownloadedList()),
                  img: "assets/images/download.png",
                  text: "Downloads"),
              const SizedBox(height: 25),
              CommonHomeContainer(
                  onTap: () => launchUrl(
                      url:
                          'https://play.google.com/store/apps/details?id=com.insta.reelsdownloader'),
                  img: "assets/images/rate_app.png",
                  text: "Rate App"),
              const SizedBox(height: 25),
              CommonHomeContainer(
                  onTap: () => launchUrl(
                      url:
                          'https://play.google.com/store/apps/developer?id=Amdavadi+Infotech'),
                  img: "assets/images/more_app.png",
                  text: "More Apps"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomAdWidget(
          margin: 20,
          buttonTitle: ConstantsString.playNow,
          title: ConstantsString.adTitle,
          description: ConstantsString.adDes,
          height: 120,
          buttonHeight: 30,
          buttonWidth: 90,
          fontSize: 12,
          onTap: () => launchUrl(
              url:
                  'https://play.google.com/store/apps/details?id=com.games.all_games_in_one_game'),
          buttonOnTap: () => launchUrl(
              url:
                  'https://play.google.com/store/apps/details?id=com.games.all_games_in_one_game'),
          imageUrl: ConstantsString.adImage),
    );
  }
}
