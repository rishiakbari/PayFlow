import 'package:flutter/material.dart';
import 'custom_gradient_text.dart';
import '../theme/colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    this.onPressed,
    required this.text,
    this.width,
    this.height,
    this.textColor,
    this.fontSize,
    this.backgroundColor,
    this.gradient,
    this.fitted = false,
    this.isGradient = true,
    this.isUnderlineText = false,
    this.icon,
    this.padding,
    this.margin,
    this.borderRadius,
  });

  final Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  final Color? textColor;
  final double? fontSize;
  final Color? backgroundColor;
  final Gradient? gradient;
  final bool fitted;
  final bool isGradient;
  final bool isUnderlineText;
  final Widget? icon;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context).platformBrightness;
    return Container(
      margin: margin,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        gradient: isGradient
            ? const LinearGradient(
                colors: [
                  Colorz.gradient1,
                  Colorz.gradient2,
                ],
                begin: Alignment.center,
                end: Alignment.bottomRight,
              )
            : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(30.0),
          color: backgroundColor ??
              (theme == Brightness.light ? Colorz.light : Colorz.dark),
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
          height: height ?? 50.0,
          minWidth: fitted ? null : width ?? double.infinity,
          onPressed: onPressed,
          child: icon != null
              ? SizedBox(
                  width: fitted ? null : width ?? double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) icon!,
                      SizedBox(width: icon != null ? 10 : 0),
                      FittedBox(
                        child: CustomGradientText(
                          text: text,
                          color: textColor,
                          fontWeight: FontWeight.w700,
                          fontSize: fontSize ?? 20,
                        ),
                      ),
                    ],
                  ),
                )
              : FittedBox(
                  child: CustomGradientText(
                    text: text,
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize ?? 20,
                  ),
                ),
        ),
      ),
    );
  }
}
