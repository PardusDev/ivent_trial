import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum AppIcons {
  bell('Bell.svg'),
  chatCircle('Chat_Circle.svg'),
  chevronLeft('Chevron_Left.svg'),
  circleHelp('Circle_Help.svg'),
  exit('Exit.svg'),
  headphones('Headphones.svg'),
  info('Info.svg'),
  lockOpen('Lock_Open.svg'),
  mail('Mail.svg'),
  shield('Shield.svg'),
  triangleWarning('Triangle_Warning.svg');

  const AppIcons(this.fileName);

  final String fileName;

  String get path => 'assets/icons/$fileName';

  SvgPicture toSvg({double? size, Color? color}) {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
    );
  }
}
