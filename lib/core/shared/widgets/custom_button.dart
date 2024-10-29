import 'package:diet/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final Function() onPressed;
  final Widget? child;
  final Color? backgroundColor;
  final double? height;

final double? width;
final Color? textColor;
  const CustomButton({
    super.key,
    this.title,
    required this.onPressed,
    this.child,
    this.backgroundColor, this.height, this.width, this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal:8),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor:backgroundColor?? AppColors.primaryColor,
        minimumSize:  Size.fromHeight(height??56),
      ),
      onPressed: onPressed,
      child: child ??
          Text(title!,
              style:  TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color:textColor??Colors.white)),
    );
  }
}
