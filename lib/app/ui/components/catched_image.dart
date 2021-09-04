import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/logger.dart';

Widget cacheImage({
  required double height,
  required double width,
  String? url,
  required Widget placeholder,
  BoxFit fit = BoxFit.scaleDown,
}) {
  return showPlaceholder(url)
      ? placeholder
      : CachedNetworkImage(
          imageUrl: url!,
          height: height,
          width: width,
          fit: fit,
          errorWidget: (context, url, dynamic error) => placeholder,
          /* ?? const Icon(Icons.error)*/
          placeholder: (context, url) {
            return placeholder;
            /* ??
          const Center(
              child: Icon(
            Icons.person,
            color: AppColors.k033660,
            size: 35,
          ));*/
          },
        );
}

Widget cacheSvgImage({
  required double height,
  required double width,
  required String url,
}) {
  return SvgPicture.network(
    url,
    height: height,
    width: width,
  );
}

bool showPlaceholder(String? url) {
  if (url == null) {
    return true;
  } else if (url == 'null') {
    return true;
  } else if (url.contains('.svg')) {
    return true;
  }
  return false;
}
