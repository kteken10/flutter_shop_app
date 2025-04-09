import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../ui/button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ValueNotifier<bool> isLogin = ValueNotifier(true);

    return Scaffold(
      body: Stack(
        children: [
          // Première moitié de l'écran avec un fond dégradé et une image
          Container(
            height: screenSize.height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary.withOpacity(0.3),
                  AppColors.primary.withOpacity(0.4),
                  AppColors.primary.withOpacity(0.6),
                  AppColors.primary,
                  Color.lerp(AppColors.primary, AppColors.ternary, 0.1)!,
                ],
                stops: const [0.0, 0.3, 0.6, 0.9, 1.0],
              ),
            ),
            child: Image.asset(
              'assets/images/auth_girl_smile.png',
              fit: BoxFit.cover,
            ),
          ),

          // Partie inférieure avec le formulaire
          Positioned.fill(
            top: screenSize.height * 0.5,
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Boutons Login/SignUp
                  Row(
                    children: [
                      Expanded(
                        child: Button(
                          text: 'Login',
                          onPressed: () => isLogin.value = true,
                          backgroundColor: isLogin.value ? AppColors.primary : Colors.grey[200]!,
                          textColor: isLogin.value ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Button(
                          text: 'Sign Up',
                          onPressed: () => isLogin.value = false,
                          backgroundColor: !isLogin.value ? AppColors.primary : Colors.white!,
                          textColor: !isLogin.value ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Contenu dynamique avec défilement si nécessaire
                  Expanded(
                    child: SingleChildScrollView(
                      child: ValueListenableBuilder<bool>(
                        valueListenable: isLogin,
                        builder: (context, value, child) {
                          return value
                              ? _buildSocialButtons()
                              : _buildSignUpContent();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        // Ligne "OR"
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Boutons sociaux
        Button(
          icon: Icons.apple,
          text: 'Continue With Apple',
          onPressed: () {},
          backgroundColor: Colors.white,
          textColor: Colors.black,
         
        ),
        const SizedBox(height: 10),
        Button(
          icon: Icons.g_mobiledata,
          text: 'Continue With Google',
          onPressed: () {},
          backgroundColor: Colors.white,
          textColor: Colors.black,
        
        ),
        const SizedBox(height: 10),
        Button(
          icon: Icons.facebook,
          text: 'Continue With Facebook',
          onPressed: () {},
          backgroundColor: Colors.white,
          textColor: Colors.black,
        
        ),
        const SizedBox(height: 20),

        // Ligne "OR Continue as a guest"
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'OR Continue as a guest',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey[400],
                thickness: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignUpContent() {
    return Column(
      children: [
        // Ajoutez ici vos champs de formulaire d'inscription
        const TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Button(
          text: 'Sign Up',
          onPressed: () {},
          backgroundColor: AppColors.primary,
          textColor: Colors.white,
        ),
      ],
    );
  }
}