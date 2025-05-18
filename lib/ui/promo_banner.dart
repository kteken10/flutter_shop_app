import 'package:flutter/material.dart';

import '../constants/colors.dart';

class PromoBanner extends StatelessWidget {
  final String price;

  const PromoBanner({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          // Niveau 2 : bannière orange
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ 
                  AppColors.primary,AppColors.primary.withOpacity(0.6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  // Textes + bouton
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'First Purchase\nEnjoy a Special\nOffer!',
                          style: TextStyle(
                            fontSize: 18,
                            height: 1.2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Shop Now',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.arrow_outward, size: 16, color: AppColors.primary),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image
                  Expanded(
                    flex: 2,
                    child: Image.asset(
                      'assets/images/girl_smile.png',
                      fit: BoxFit.contain,
                      height: 130,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Niveau 3 : prix encapsulé dans un container blanc
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
