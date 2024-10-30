import 'package:flutter/material.dart';
import 'screens/onboarding/index.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingPage(),
        '/home': (context) => const HomePage(), 
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Accueil")),
      body: const Center(child: Text("Bienvenue dans l'application !")),
    );
  }
}
