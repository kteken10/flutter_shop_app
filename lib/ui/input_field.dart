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
              // Ajouter une couleur de fond sans bordure
              fillColor: AppColors.quadrary.withOpacity(0.1), // Exemple de couleur de fond
              filled: true,  // Activer le fond coloré
              border: InputBorder.none, // Retirer les bordures
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Ajuster le padding intérieur du champ
            ),
          ),
        ],
      ),
    );
  }
}
