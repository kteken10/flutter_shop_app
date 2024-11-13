import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, // Couleur de fond de l'AppBar
        elevation: 0, // Pour enlever l'ombre de l'AppBar
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
          children: [
            Text(
              'Discover',
              style: TextStyle(
                color: Colors.black, // Couleur du texte
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.shopping_bag_outlined, // Icône que vous voulez afficher
              color: Colors.black, // Couleur de l'icône
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Fond de l'écran
      body: const Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
