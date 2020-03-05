import 'package:flutter/material.dart';

class ResImages {
  static String wrapAssets(String url) {
    return "assets/images/" + url;
  }

  static Widget icon(String name,
      {double width, double height, BoxFit boxFit}) {
    return Image.asset(
      wrapAssets(name),
      width: width,
      height: height,
      fit: boxFit,
    );
  }
}
