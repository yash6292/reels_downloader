import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reels_downloader/controller/instagram_login.dart';
import 'package:reels_downloader/model/insta_post_with_login.dart';
import 'package:reels_downloader/model/insta_post_without_login.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart' as wb;

class DownloadController extends GetxController {
  RxBool processing = false.obs;
  bool isLogin = false;
  String? path;
  var box = GetStorage();
  Dio dio = Dio();

  Future<String?> startDownload(String link, BuildContext context) async {
    // Asking for video storage permission
    await Permission.storage.request();
    isLogin = false;
    // Checking for Cookies

    final cookieManager = wb.WebviewCookieManager();
    final gotCookies =
        await cookieManager.getCookies('https://www.instagram.com/');
    // is Cookie found then set isLogin to true
    if (gotCookies.isNotEmpty) isLogin = true;

    // Build the url
    var linkParts = link.replaceAll(" ", "").split("/");
    var url = '${linkParts[0]}//${linkParts[2]}/${linkParts[3]}/${linkParts[4]}'
        "?__a=1&__d=dis";

    var httpClient = HttpClient();
    String? videoURLLLLL;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      for (var element in gotCookies) {
        request.cookies.add(Cookie(element.name, element.value));
      }
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        if (isLogin) {
          InstaPostWithLogin postWithLogin = InstaPostWithLogin.fromJson(data);
          videoURLLLLL = postWithLogin.items?.first.videoVersions?.first.url;
        } else {
          InstaPostWithoutLogin post = InstaPostWithoutLogin.fromJson(data);
          videoURLLLLL = post.graphql?.shortcodeMedia?.videoUrl;
        }
      }
    } catch (exception) {
      // Login to instagram in case of Cookie expire or download any private account's video
      // ignore: use_build_context_synchronously
      await Navigator.push(
          context, MaterialPageRoute(builder: (_) => const InstaLogin()));
    }

    // Download video & save
    if (videoURLLLLL == null) {
      return null;
    } else {
      Random random = Random();
      int randomNumber = random.nextInt(1000);
      Directory appDocDir = Directory('/storage/emulated/0/Reels Downloader');
      String savePath = "${appDocDir.path}/1654585$randomNumber.mp4";
      await dio.download(videoURLLLLL, savePath);
      final result =
          await ImageGallerySaver.saveFile(savePath, isReturnPathOfIOS: true);
      return result["filePath"];
    }
  }

  downloadReal(String link, BuildContext context) async {
    try {
      processing.value = true;
      path = null;
      update();
      await startDownload(link, context).then((value) {
        if (value == null) throw Exception();
        path = value;
        update();
        List allVideosPath = box.read("allVideo") ?? [];
        allVideosPath.add(path);
        box.write("allVideo", allVideosPath);
      });
      processing.value = false;
    } catch (e) {
      processing.value = false;
      rethrow;
    }
  }
}
