import 'package:flutter/material.dart';
import 'package:myshop/ui/text.dart';

import '../constants/colors.dart';

class PromoZone extends StatelessWidget {
  final String imagePath; // Chemin de l'image
  final Color backgroundColor; // Couleur de fond
  final String text; // Texte à afficher du côté gauche

  const PromoZone({
    super.key,
    required this.imagePath,
    required this.text, // Texte obligatoire
    this.backgroundColor = AppColors.primary, // Couleur par défaut
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Hauteur du rectangle
      width: double.infinity, // Prend toute la largeur disponible
      decoration: BoxDecoration(
        color: backgroundColor, // Couleur de fond
        borderRadius: BorderRadius.circular(16), // Coins arrondis
      ),
      child: Row(
        children: [
          // Colonne avec texte et rectangle en dessous
          Expanded(
            flex: 1, // Prend la moitié de la largeur
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0), // Espacement en haut et à gauche
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texte blanc positionné en haut à l'extrémité gauche
                  TextWidget(
                    text,
                    typeText: TextType.text3Xl,
                    style: const TextStyle(
                      color: Colors.white, // Couleur du texte
                    ),
                  ),
                  const SizedBox(height: 8), // Espacement entre le texte et le rectangle
                  // Rectangle sous le texte
                 Container(
  height: 40, // Hauteur du rectangle
  width: 120, // Largeur du rectangle
  decoration: BoxDecoration(
    color: Colors.white, // Couleur du rectangle
    borderRadius: BorderRadius.circular(20), // Coins arrondis
  ),
  alignment: Alignment.center, // Centre le texte dans le container
  child: const Text(
    'Up To 50%', // Texte à afficher dans le rectangle
    style: TextStyle(
      color: AppColors.primary, // Couleur du texte
      fontSize: 16, // Taille de la police
    ),
  ),
)

                ],
              ),
            ),
          ),
          // L'image prenant la moitié droite
          Expanded(
            flex: 1, // Prend la moitié de la largeur
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ), // Coins arrondis uniquement à droite
              child: Image.asset(
                'assets/$imagePath', // Chemin de l'image
                fit: BoxFit.fitHeight, // Ajuster la hauteur uniquement
              ),
            ),
          ),
        ],
      ),
    );
  }
}
