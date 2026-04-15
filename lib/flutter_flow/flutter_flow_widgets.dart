import 'package:flutter/material.dart';

class FFButtonWidget extends StatelessWidget {
  const FFButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.options,
  });

  final String text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final FFButtonOptions? options;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: options?.width,
      height: options?.height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: options?.color ?? Colors.blue,
          padding: options?.padding,
          elevation: options?.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: options?.borderRadius ?? BorderRadius.circular(8),
            side: options?.borderSide ?? BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 8),
            Text(text, style: options?.textStyle),
          ],
        ),
      ),
    );
  }
}

class FFButtonOptions {
  const FFButtonOptions({
    this.textStyle,
    this.elevation,
    this.color,
    this.width,
    this.height,
    this.padding,
    this.iconPadding,
    this.iconColor,
    this.borderRadius,
    this.borderSide,
  });
  final TextStyle? textStyle;
  final double? elevation;
  final Color? color;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? iconPadding;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
}
