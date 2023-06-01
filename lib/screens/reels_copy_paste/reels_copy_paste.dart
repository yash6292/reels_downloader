import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reels_downloader/controller/DownloadController.dart';
import 'package:reels_downloader/screens/downloads/download_reels.dart';
import 'package:reels_downloader/utils/constants.dart';
import 'package:reels_downloader/utils/custom_ad_widget.dart';
import 'package:reels_downloader/utils/launch_url.dart';
import 'package:reels_downloader/utils/loadder.dart';

class ReelsCopyPastePage extends StatefulWidget {
  const ReelsCopyPastePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReelsCopyPastePageState createState() => _ReelsCopyPastePageState();
}

class _ReelsCopyPastePageState extends State<ReelsCopyPastePage> {
  DownloadController downloadController = Get.put(DownloadController());
  TextEditingController urlController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/instagram.png',
                  height: 60,
                  fit: BoxFit.cover,
                ),
                const Text(
                  "Instagram",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 60),
                TextFormField(
                    controller: urlController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                        hintText: "Paste Link",
                        fillColor: Colors.white70),
                    validator: (value) {
                      if (value?.isEmpty ?? false) {
                        return 'Please enter link';
                      } else if (value?.contains('reel') == false) {
                        return 'Please enter reel link not other';
                      }
                    }),
                const SizedBox(height: 30),
                Obx(
                  () => downloadController.processing.value
                      ? const Loadder(msg: '   Downloading...')
                      : InkWell(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              await downloadController.downloadReal(
                                  urlController.text, context);

                              Get.to(DownloadReelsPage(
                                  path: "${downloadController.path}"));

                              urlController.clear();
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 150,
                            decoration: const BoxDecoration(
                              color: Colors.pinkAccent,
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              "Download",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                ),
              ],
            ),
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
