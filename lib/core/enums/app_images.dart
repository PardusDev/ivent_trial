import 'package:flutter/material.dart';

enum AppImages {
  iventHeader('ivent_header.png');

  const AppImages(this.fileName);

  final String fileName;

  String get path => 'assets/images/$fileName';

  Widget toImage({double? width, double? height, BoxFit? fit}) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
