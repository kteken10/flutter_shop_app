import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../ui/button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    const buttonHeight = 40.0; // Hauteur commune pour les deux éléments

    return Scaffold(
      body: Stack(
        children: [
          // Fond gradient (conservé comme dans votre version originale)
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

          // Image centrale
          Center(
            child: SizedBox(
              height: screenSize.height * 0.79,
              width: screenSize.width * 0.9,
              child: Image.asset(
                'assets/images/girl_smile.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          // Bouton et icône en bas
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Bouton principal
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: buttonHeight,
                    child: Button(
                      text: "Let's Get Started",
                      onPressed: () {
                        // Logique de navigation
                      },
                      height: buttonHeight,
                      borderRadius: 30,
                    ),
                  ),
                ),
                
                // Cercle avec icône
                Container(
                  width: buttonHeight,
                  height: buttonHeight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, size: 24),
                    color: AppColors.primary,
                    onPressed: () {
                      // Même action que le bouton principal
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}