import 'package:flutter/material.dart';
import 'package:reels_downloader/utils/font_style.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomAdWidget extends StatelessWidget {
  final String? title;
  final String? buttonTitle;
  final String? description;
  final String? imageUrl;
  final Color? color;
  final Color? fontColor;
  final double? height;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? margin;
  final Function()? buttonOnTap;
  final Function()? onTap;
  final double? fontSize;

  const CustomAdWidget(
      {Key? key,
      this.title,
      this.description,
      this.imageUrl,
      this.height,
      this.margin,
      this.color,
      this.fontColor,
      this.buttonWidth,
      this.buttonHeight,
      this.buttonTitle,
      this.buttonOnTap,
      this.onTap,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 120,
      margin: EdgeInsets.all(margin ?? 0),
      decoration: BoxDecoration(
          color: color ?? Colors.purple.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        child: Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: SizedBox(
                    width: 100,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "$imageUrl",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          placeholder: (context, url) =>
                              Image.asset('assets/images/logo.png'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 20,
                              width: 25,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(7),
                                    topLeft: Radius.circular(7),
                                  )),
                              child: const Center(
                                child: Text("Ad",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    overflow: TextOverflow.ellipsis,
                    style: FontStyleUtilities.h5(
                        fontWeight: FWT.bold, fontColor: Colors.white),
                  ),
                  Text(
                    "$description",
                    overflow: TextOverflow.visible,
                    maxLines: 2,
                    style: FontStyleUtilities.t4(fontColor: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: buttonOnTap,
                    child: Container(
                        height: buttonHeight ?? 35,
                        width: buttonWidth ?? 130,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: color ?? Colors.white),
                        child: Text(buttonTitle ?? '',
                            style: TextStyle(
                              color: fontColor ?? Colors.purple,
                              fontWeight: FontWeight.w800,
                              fontSize: fontSize ?? 15.0,
                            ))),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
