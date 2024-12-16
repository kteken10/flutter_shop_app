import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

import '../../constants/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteBack,  
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxHeight: screenHeight-32 , // Utilise 80% de la hauteur de l'\u00e9cran
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColors.whiteContainer,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 248, 246, 246),
                      offset: Offset(4, 4),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Color.fromARGB(255, 248, 246, 246),
                      offset: Offset(-4, -4),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Onboarding(
                  swipeableBody: [
                    _buildScreen(
                      title: "Bienvenue dans notre boutique",
                      body: "Explorez des milliers de produits \u00e0 port\u00e9e de main.",
                      image: 'assets/ecommerce1.jpg',
                    ),
                    _buildScreen(
                      title: "Facilit\u00e9 d'utilisation",
                      body: "Naviguez ais\u00e9ment gr\u00e2ce \u00e0 notre interface intuitive.",
                      image: 'assets/ecommerce2.jpg',
                    ),
                    _buildScreen(
                      title: "Cr\u00e9ez votre compte",
                      body: "Inscrivez-vous en quelques clics pour profiter de nos offres exclusives.",
                      image: 'assets/ecommerce3.jpg',
                    ),
                  ],
                  startIndex: 0,
                  onPageChanges: (netDragDistance, ScreensLength, currentIndex, slideDirection) {
                    setState(() {
                      this.currentIndex = currentIndex;
                    });
                  },
                  buildHeader: (context, netDragDistance, ScreensLength, currentIndex, setIndex, slideDirection) {
                   return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Icon(
                            FontAwesomeIcons.circleChevronRight,  
                            color: AppColors.secondary,               
                            size: 24,                            
                          ),
                        ),
                      ],
                    );
                  },
                  buildFooter: (context, netDragDistance, ScreensLength, currentIndex, setIndex, slideDirection) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildIndicator(ScreensLength, currentIndex),
                        ],
                      ),
                    );
                  },
                  animationInMilliseconds: 300,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreen({required String title, required String body, required String image}) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.3, // Limiter la taille de l'image
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            body,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator(int screensLength, int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(screensLength, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: currentIndex == index ? 5.0 : 5.0,
          height: currentIndex == index ? 5.0 : 7,
          decoration: BoxDecoration(
            color: currentIndex == index ? AppColors.primary : Colors.grey,
            borderRadius: currentIndex == index ? BorderRadius.circular(0) : BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
