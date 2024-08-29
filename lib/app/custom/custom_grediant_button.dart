import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/colors.dart';

class CustomGrediantButton extends StatelessWidget {
  const CustomGrediantButton({
    super.key,
    this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.opecity,
    this.textColor,
    this.fontSize,
    this.backgroundColor,
    this.gradient,
    this.isGradient = false,
    this.fitted = false,
    this.padding,
    this.margin,
  });

  final Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? opecity;
  final Color? textColor;
  final double? fontSize;
  final Color? backgroundColor;
  final Gradient? gradient;
  final bool isGradient;
  final bool fitted;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: gradient ??
            (backgroundColor != null || !isGradient
                ? null
                : LinearGradient(
                    // stops: [1.0, 1.0, 1.0],
                    colors: [
                      Colorz.gradient1.withOpacity(opecity ?? 1.0),
                      Colorz.gradient2.withOpacity(opecity ?? 1.0),
                      Colorz.gradient3.withOpacity(opecity ?? 1.0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
        boxShadow: opecity != null
            ? []
            : [
                BoxShadow(
                  color: Get.isPlatformDarkMode
                      ? Colorz.buttonShadow
                      : Colorz.buttonShadow,
                  offset: const Offset(0.0, 15), //(x,y)
                  blurRadius: 30,
                ),
              ],
        color: backgroundColor,
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0,
            ),
        height: height ?? 65.0,
        minWidth: fitted ? null : width ?? double.infinity,
        onPressed: onPressed,
        child: Text(
          text,
          style: Get.textTheme.titleMedium!.copyWith(
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: fontSize ?? 20,
          ),
        ),
      ),
    );
  }
}
