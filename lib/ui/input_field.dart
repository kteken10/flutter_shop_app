import 'package:flutter/material.dart';
import '../constants/colors.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;

  const InputField({
    super.key,
    required this.controller,
    this.label = '',  
    required this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              // Ajouter une couleur de fond
              fillColor: AppColors.quadrary.withOpacity(0.1),
              filled: true,
              // Ajuster le padding interne (ajout de padding horizontal)
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0, 
                horizontal: 16.0, // Padding horizontal ajusté ici
              ),
              // Ajouter des coins arrondis
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide(color: AppColors.primary, width: 0.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
