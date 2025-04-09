import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height;
  final double borderRadius;
  final IconData? icon;
  final Color? borderColor;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = AppColors.primary,
    this.height = 50,
    this.borderRadius = 30,
    this.icon,
    this.borderColor
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
            color: borderColor ?? AppColors.grayFineColor.withOpacity(0.4), // Couleur de la bordure
            width: 1.0, // Ajout d'une largeur pour la bordure
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20),
            const SizedBox(width: 10),
          ],
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