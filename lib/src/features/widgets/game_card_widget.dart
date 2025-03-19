import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getoutofthebox/core/common/styles.dart';

class GameCardWidget extends StatelessWidget {
  final String title;
  final String pathImage;
  final void Function() onPressed;
  final bool haveAccess;

  const GameCardWidget(
      {super.key,
      required this.title,
      required this.pathImage,
      required this.onPressed,
      required this.haveAccess});

  @override
  Widget build(BuildContext context) {
    Logger.i('pathImage: $pathImage');
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 174,
            padding:
                const EdgeInsets.only(left: 15, right: 10, top: 20, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: StyleManager.blocColor,
                border:
                    Border.all(color: StyleManager.grayColor.withOpacity(0.3))),
            child: Text(
              title,
              style: TextStylesManager.smallBlackTitle,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: CachedNetworkImage(
              imageUrl: pathImage,
              placeholder: (context, url) => FutureBuilder(
                future: Future.delayed(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return const Icon(Icons.image);
                  }
                  return const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                        color: StyleManager.mainColor),
                  );
                },
              ),
              errorWidget: (context, url, error) => const Icon(Icons.image),
            ),
          ),
          Positioned(
            bottom: 17,
            right: 17,
            child: SvgPicture.asset('assets/icons/arrow.svg'),
          ),
        ],
      ),
    );
  }
}
