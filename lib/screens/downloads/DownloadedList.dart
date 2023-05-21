import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reels_downloader/screens/GenrateVideoFrompath/GenrateVideoFromPath.dart';
import 'package:reels_downloader/utils/loadder.dart';

class DownloadedList extends StatefulWidget {
  const DownloadedList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DownloadedListState createState() => _DownloadedListState();
}

class _DownloadedListState extends State<DownloadedList> {
  var box = GetStorage();
  bool loadingVideos = true;
  bool? existsSync;
  List allVideos = [];

  @override
  void initState() {
    allVideos = box.read("allVideo") ?? [];
    loadingVideos = false;

    setState(() {});
    super.initState();
  }

  Future getVideo() async {
    // allVideos.forEach((element) {
    //   existsSync =
    //       File("storage/emulated/0/Pictures/${element.split('/').last}")
    //           .existsSync();
    //   print('existsSync $existsSync');
    // print(
    //     'existsSync "storage/emulated/0/Pictures/${element.split('/').last}');
    // });
  }

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
          "Downloads",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: loadingVideos
          ? const Loadder()
          : GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.3,
              children: List<Widget>.generate(
                  allVideos.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GenrateVideoFrompath(allVideos[index]),
                      )),
            ),
    );
  }
}
