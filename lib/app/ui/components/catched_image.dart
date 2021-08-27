import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:six/app/data/config/app_colors.dart';

Widget cacheImage({
  required double height,
  required double width,
  required String url,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    height: height,
    width: width,
    fit: BoxFit.scaleDown,
    errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
    placeholder: (context, url) {
      return Center(
          child: const Icon(
        Icons.person,
        color: AppColors.k033660,
        size: 35,
      ));
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
