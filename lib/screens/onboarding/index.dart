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
    return Scaffold(
      body: Onboarding(
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
          return Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text("Passer"),
            ),
          );
        },
        buildFooter: (context, netDragDistance, pagesLength, currentIndex, setIndex, slideDirection) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIndicator(pagesLength, currentIndex),
                _buildCircle(),
              ],
            ),
          );
        },
        animationInMilliseconds: 300,
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
            color: currentIndex == index ? AppColors.blueSkin : Colors.grey,
            borderRadius: currentIndex == index ? BorderRadius.circular(0) : BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
  Widget _buildCircle() {
    return GestureDetector(
      onTap: () {
        // Passer à la page suivante
        if (currentIndex < 2) { // 2 est l'index de la dernière page (0, 1, 2)
          setState(() {
            currentIndex++;
          });
        } else {
          // Si c'est la dernière page, naviguez vers la page d'accueil
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: FaIcon(
            FontAwesomeIcons.arrowRight,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
