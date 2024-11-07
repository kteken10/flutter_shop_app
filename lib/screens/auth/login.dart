import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/constants/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email ID',
                        labelStyle: TextStyle(color: AppColors.secondary),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.blueSkin),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.secondary),
                        ),
                        prefixIcon: Icon(FontAwesomeIcons.at,
                            color: AppColors.secondary),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(color: AppColors.secondary),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.blueSkin),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.secondary),
                            ),
                            prefixIcon:
                                Icon(Icons.lock, color: AppColors.secondary),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              print('Forgot password clicked');
                            },
                            child: const Text(
                              'Forgot?',
                              style: TextStyle(
                                color: AppColors.blueSkin,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Ajout du bouton "Login" qui prend toute la largeur
                    SizedBox(
                      width: double.infinity,  // Prend toute la largeur
                      
                      child: ElevatedButton(
                        onPressed: () {
                          print('Login button pressed');
                          // Ajoute ici la logique pour la connexion
                        },
                       
                        style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        

                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 40),
                    const Text(
                      'Or, login With...',
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: AppColors.secondary.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              size: 25,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: AppColors.secondary.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: AppColors.secondary.withOpacity(0.2)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Icon(
                              FontAwesomeIcons.apple,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New to MakVita?',
                          style: TextStyle(
                            color: AppColors.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: AppColors.blueSkin, 
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
