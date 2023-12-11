import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ASvgIcon extends StatelessWidget {
  final String assetName;
  final Color? color;
  final double? height;
  final double? width;

  const ASvgIcon(
      {Key? key, required this.assetName, this.color, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      color: color,
      height: height,
      width: width,
    );
  }
}
