import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomGradientText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final bool isGradient;

  const CustomGradientText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.isGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return color == null
        ? ShaderMask(
            shaderCallback: (bounds) {
              return const LinearGradient(
                stops: [0.0, 1.0],
                colors: [
                  Colorz.gradient2,
                  Colorz.gradient1,
                ],
                begin: Alignment.topLeft,
                end: Alignment.center,
              ).createShader(bounds);
            },
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: color ?? Colors.white,
              ),
            ),
          )
        : Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color ?? Colors.white,
            ),
          );
  }
}
