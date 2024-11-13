import 'package:flutter/material.dart';

import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../screens/onboarding/onboarding.dart';
import '../ui/bottom_nav.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onboarding',  
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/bottomNav': (context) => const BottomNavBar(),  
      },
    );
  }
}
