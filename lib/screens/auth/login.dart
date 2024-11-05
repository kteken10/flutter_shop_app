import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/constants/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBack,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/ecommerce2.jpg',
                      height: 250,
                      width: 250,
                    ),
                    // Titre
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Champ Email
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email ID',
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blueSkin),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grayProd),
                        ),
                        prefixIcon: Icon(FontAwesomeIcons.at,
                            color: AppColors.grayProd),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Champ Password avec "Forgot?"
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blueSkin),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.grayProd),
                            ),
                            prefixIcon: Icon(Icons.lock,
                                color: AppColors.grayProd),
                          ),
                        ),
                        Positioned(
                          right: 0,
                         
                          child: GestureDetector(
                            onTap: () {
                              // Ici tu peux naviguer ou afficher un message
                              print('Forgot password clicked');
                            },
                            child: const Text(
                              'Forgot?',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Bouton de connexion
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text("Pas encore de compte? Inscrivez-vous."),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
