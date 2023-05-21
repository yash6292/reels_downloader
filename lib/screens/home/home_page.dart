import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_downloader/screens/downloads/DownloadedList.dart';
import 'package:reels_downloader/screens/reels_copy_paste/reels_copy_paste.dart';
import 'package:reels_downloader/screens/home/common_home_container..dart';

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
              'Video ',
              style: TextStyle(
                  color: Colors.purpleAccent, fontWeight: FontWeight.bold),
            ),
            Text(
              'Downloader ',
              style: TextStyle(
                  color: Colors.amberAccent, fontWeight: FontWeight.bold),
            ),
          ])),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 25),
            CommonHomeContainer(
                onTap: () => Get.to(const ReelsCopyPastePage()),
                img: "https://cdn-icons-png.flaticon.com/512/3621/3621435.png",
                text: "Reels Downloader"),
            const SizedBox(height: 25),
            CommonHomeContainer(
                onTap: () => Get.to(const DownloadedList()),
                img:
                    "https://cdn.pixabay.com/photo/2016/12/18/13/45/download-1915753_960_720.png",
                text: "Downloads"),
            const SizedBox(height: 25),
            CommonHomeContainer(
                onTap: () => Get.to(const ReelsCopyPastePage()),
                img: "https://cdn-icons-png.flaticon.com/512/4122/4122962.png",
                text: "Rate App"),
            const SizedBox(height: 25),
            CommonHomeContainer(
                onTap: () => Get.to(const ReelsCopyPastePage()),
                img:
                    "https://cdn3d.iconscout.com/3d/premium/thumb/apps-7025902-5700349.png",
                text: "More Apps")
          ],
        ),
      ),
    );
  }
}
