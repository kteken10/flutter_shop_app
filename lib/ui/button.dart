import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final IconData? icon;
  final String? svgPath;
  final Color? borderColor;
  final Color? svgColor;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = AppColors.primary,
    this.height = 50,
    this.borderRadius = 30,
    this.icon,
    this.svgPath,
    this.borderColor,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        foregroundColor: textColor,
        surfaceTintColor: Colors.transparent,
        minimumSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor ?? AppColors.grayFineColor.withOpacity(0.4),
            width: 1.0,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          if (svgPath != null) 
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                svgPath!,
                height: 20,
                width: 20,
                colorFilter: svgColor != null 
                    ? ColorFilter.mode(svgColor!, BlendMode.srcIn)
                    : null,
              ),
            )
          else if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(icon, size: 20),
            ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}