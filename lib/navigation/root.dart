import 'package:flutter/material.dart';

import '../screens/auth/login.dart';
import '../screens/auth/signup.dart';
import '../screens/onboarding/onboarding.dart';
import '../ui/bottom_nav.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onboarding',  
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/bottomNav': (context) => const BottomNavBar(),  
      },
    );
  }
}
