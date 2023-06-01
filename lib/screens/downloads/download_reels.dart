import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_downloader/controller/DownloadController.dart';
import 'package:reels_downloader/screens/GenrateVideoFrompath/GenrateVideoFromPath.dart';
import 'package:reels_downloader/screens/video_player/VideoPlayer.dart';
import 'package:reels_downloader/utils/constants.dart';
import 'package:reels_downloader/utils/custom_ad_widget.dart';
import 'package:reels_downloader/utils/launch_url.dart';

// ignore: must_be_immutable
class DownloadReelsPage extends StatelessWidget {
  final String? path;

  DownloadReelsPage({Key? key, this.path}) : super(key: key);

  DownloadController downloadController = Get.put(DownloadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios_new_rounded),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Downloaded Reels",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetBuilder(
          init: downloadController,
          builder: (_) => SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      height: 280,
                      width: 200,
                      child: path != null
                          ? GenrateVideoFrompath(path ?? '')
                          : const Center(child: Text("No recent download")),
                    ),
                  ]),
                  const SizedBox(height: 25),
                  InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25),
                    ),
                    onTap: () => Get.to(VideoPlayer(path ?? '')),
                    child: Container(
                      height: 45,
                      width: 250,
                      decoration: const BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        "Play Now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ]),
              )),
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
