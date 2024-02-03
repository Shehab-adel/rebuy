import 'package:flutter/material.dart';
import 'package:rebuy/core/app_export.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    this.margin,
    required this.onPressed,
    this.buttonStyle,
    this.style,
    this.height,
    this.width,
    required this.text,
  }) : super();

  final BoxDecoration? decoration;

  final Widget? leftIcon;
  final Widget? rightIcon;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? margin;
  final ButtonStyle? style;
  final TextStyle? buttonStyle;
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height ?? 57.v,
      width: this.width ?? double.maxFinite,
      margin: margin ?? EdgeInsets.all(4),
      decoration: decoration,
      child: ElevatedButton(
        style: style,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftIcon ?? const SizedBox.shrink(),
            Text(
              text,
              style: buttonStyle ??
                  CustomTextStyles.titleSmallOnPrimaryContainer_1,
            ),
            rightIcon ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
