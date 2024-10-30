import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
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
            image: 'assets/ecommerce1.png',
          ),
          _buildPage(
            title: "Facilité d'utilisation",
            body: "Naviguez aisément grâce à notre interface intuitive.",
            image: 'assets/ecommerce2.png',
          ),
          _buildPage(
            title: "Créez votre compte",
            body: "Inscrivez-vous en quelques clics pour profiter de nos offres exclusives.",
            image: 'assets/ecommerce3.png',
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
                Navigator.pushReplacementNamed(context, '/home');
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
            color: currentIndex == index ? Colors.blue : Colors.grey,
            borderRadius: currentIndex == index ? BorderRadius.circular(0) : BorderRadius.circular(4), 
          ),
        );
      }),
    );
  }

  Widget _buildCircle() {
    return Container(
      width: 65,
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.blue, // Changez la couleur si nécessaire
        shape: BoxShape.circle,
      ),
    );
  }
}
