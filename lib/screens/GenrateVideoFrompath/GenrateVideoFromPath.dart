import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_downloader/screens/video_player/VideoPlayer.dart';
import 'package:reels_downloader/utils/loadder.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class GenrateVideoFrompath extends StatefulWidget {
  final String path;
  const GenrateVideoFrompath(this.path, {super.key});
  @override
  // ignore: library_private_types_in_public_api
  _GenrateVideoFrompathState createState() => _GenrateVideoFrompathState();
}

class _GenrateVideoFrompathState extends State<GenrateVideoFrompath> {
  // ignore: prefer_typing_uninitialized_variables
  var uint8list;
  bool loading = true;
  bool? existsSync;
  @override
  void initState() {
    genrateThumb();
    super.initState();
  }

  genrateThumb() async {
    try {
      await VideoThumbnail.thumbnailData(
        video: widget.path,
        imageFormat: ImageFormat.JPEG,
        maxWidth: 500,
        quality: 100,
      ).then((value) {
        uint8list = value;
        loading = false;

        setState(() {});
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return uint8list != null
        ? loading
            ? const Loadder()
            : InkWell(
                onTap: () {
                  Get.to(VideoPlayer(widget.path));
                },
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: MemoryImage(uint8list),
                              fit: BoxFit.cover)),
                    ),
                    ClipOval(
                      child: Container(
                          color: Colors.black38,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ))
        : Container(
            alignment: Alignment.center,
            width: 500,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(20)),
            child: const Text(
              textAlign: TextAlign.center,
              'This reel is deleted by you from the local storage',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ));
  }
}
