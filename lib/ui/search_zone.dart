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
    this.spacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        
        // Bouton caméra (seulement si onCameraPressed est fourni)
        if (onCameraPressed != null)
          IconButton(
            icon: const Icon(Icons.camera_alt, color: AppColors.gray),
            onPressed: onCameraPressed,
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(color: AppColors.grayFineColor),
              ),
            ),
          ),
      ],
    );
  }
}