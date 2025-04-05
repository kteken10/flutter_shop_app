import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double height; // Nouveau paramètre pour la hauteur
  final double borderRadius;

  const Button({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = AppColors.primary,
    this.height = 40, // Hauteur par défaut de 60 (identique au cercle)
    this.borderRadius = 30, // Augmenté pour correspondre au nouveau design
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        minimumSize: Size.fromHeight(height), // Utilisation de la hauteur fixe
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}