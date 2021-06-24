import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';

Widget cacheImage({
  required double height,
  required double width,
  required String url,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    height: height,
    width: width,
    fit: BoxFit.fill,
    errorWidget: (context, url, dynamic error) => new Icon(Icons.error),
    placeholder: (context, url) {
      return Center(child: buildLoader());
    },
  );
}
