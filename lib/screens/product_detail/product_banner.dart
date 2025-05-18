import 'package:flutter/material.dart';
import '../../constants/colors.dart';


class ProductBanner extends StatelessWidget {
  final String price;
  final String imagePath;

  const ProductBanner({
    super.key, 
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white, // Niveau 1 : fond blanc
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Niveau 2 : bannière orange simplifiée
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Row(
              children: [
            
                
                // Image du produit
                Expanded(
                  
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fitWidth,
                    height: 240,
                    // width: 400,
                  ),
                ),
              ],
            ),
          ),

          // Niveau 3 : prix encapsulé (inchangé)
          Positioned(
            bottom: -6,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Text(
                  price,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}