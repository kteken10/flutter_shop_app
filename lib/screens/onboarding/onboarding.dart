import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

import '../../constants/colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
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
                height: screenHeight - 32,
                // padding: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
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
                    _buildPage(
                      title: "Bienvenue dans notre boutique",
                      body: "Explorez des milliers de produits à portée de main.",
                      image: 'assets/ecommerce1.jpg',
                    ),
                    _buildPage(
                      title: "Facilité d'utilisation",
                      body: "Naviguez aisément grâce à notre interface intuitive.",
                      image: 'assets/ecommerce2.jpg',
                    ),
                    _buildPage(
                      title: "Créez votre compte",
                      body: "Inscrivez-vous en quelques clics pour profiter de nos offres exclusives.",
                      image: 'assets/ecommerce3.jpg',
                    ),
                  ],
                  startIndex: 0,
                  onPageChanges: (netDragDistance, pagesLength, currentIndex, slideDirection) {
                    setState(() {
                      this.currentIndex = currentIndex;
                    });
                  },
                  buildHeader: (context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection) {
                   return Row(
                      mainAxisAlignment: MainAxisAlignment.end, // Aligner l'icône à droite
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: const Icon(
                            FontAwesomeIcons.circleChevronRight,  
                            color: AppColors.secondary,               
                            size: 24,                            
                          ),
                        ),
                      ],
                    );
                  },
                  buildFooter: (context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildIndicator(pagesLength, currentIndex),
                         
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

  Widget _buildPage({required String title, required String body, required String image}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
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
    );
  }

  Widget _buildIndicator(int pagesLength, int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(pagesLength, (index) {
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
