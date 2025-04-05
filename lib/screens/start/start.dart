import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Fond dégradé orange
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.primary.withOpacity(0.3),
                  AppColors.primary.withOpacity(0.6),
                  AppColors.primary,
                  Color.lerp(AppColors.primary, AppColors.ternary, 0.1)!,
                ],
                stops: const [0.0, 0.3, 0.6, 0.8, 1.0],
              ),
            ),
          ),

          // Image centrée prenant la majeure partie de l'écran
          Center(
            child: Container(
              height: screenHeight - 180, // Hauteur écran - marge pour le bouton
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/familysmile.png',
                fit: BoxFit.cover
             
              ),
            ),
          ),

          // Bouton en bas de l'écran
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primary,
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  // Navigation vers l'écran suivant
                },
                child: const Text(
                  "Let's Get Started",
                  style: TextStyle(
                    fontSize: 18,
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