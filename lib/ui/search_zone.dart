import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'input_field.dart';

class SearchZone extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onCameraPressed;
  final VoidCallback? onMicPressed;
  final String hintText;
  final bool showSearchIcon;
  final double spacing;

  const SearchZone({
    super.key,
    required this.controller,
    this.onCameraPressed,
    this.onMicPressed,
    this.hintText = 'Search',
    this.showSearchIcon = true,
    this.spacing = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Alignement vertical central
      children: [
        // Champ de recherche étendu
        Expanded(
          child: InputField(
            controller: controller,
            keyboardType: TextInputType.text,
            obscureText: false,
            showSearchIcon: showSearchIcon,
            hintText: hintText,
            borderColor: AppColors.grayFineColor,
            suffixIcon: onMicPressed != null
                ? IconButton(
                    icon: const Icon(Icons.mic, color: AppColors.gray),
                    onPressed: onMicPressed,
                  )
                : null,
          ),
        ),
        
        // Espacement
        SizedBox(width: spacing),
        
        // Bouton caméra parfaitement aligné
        if (onCameraPressed != null)
          Container(
            height: 40, // Hauteur égale au champ de saisie
            width: 40,  // Largeur égale à la hauteur pour un carré parfait
            margin: const EdgeInsets.only(top: 8), // Compensation du padding interne
            child: IconButton(
              icon: const Icon(Icons.camera_alt, size: 20, color: AppColors.ternary),
              onPressed: onCameraPressed,
              padding: EdgeInsets.zero, // Supprime le padding interne
              style: IconButton.styleFrom(
                backgroundColor: AppColors.grayFineColor.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: AppColors.grayFineColor, width: 1),
                ),
              ),
            ),
          ),
      ],
    );
  }
}