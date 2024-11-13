import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myshop/constants/colors.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                        'Inscription',
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.ternary
                         
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Nom',
                        labelStyle: TextStyle(color: AppColors.grayFineColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grayFineColor),
                        ),
                        prefixIcon: Icon(Icons.person, color: AppColors.quadrary),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email ID',
                        labelStyle: TextStyle(color: AppColors.grayFineColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grayFineColor),
                        ),
                        prefixIcon: Icon(FontAwesomeIcons.at, color: AppColors.quadrary),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        labelStyle: TextStyle(color: AppColors.grayFineColor),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.grayFineColor),
                        ),
                        prefixIcon: Icon(Icons.lock, color: AppColors.quadrary),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text(
                      'Ou, inscrivez-vous avec...',
                      style: TextStyle(
                        color: AppColors.grayFineColor,
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
                                color: AppColors.grayFineColor.withOpacity(0.2)),
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
                                color: AppColors.grayFineColor.withOpacity(0.2)),
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
                                color: AppColors.grayFineColor.withOpacity(0.2)),
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
                    SizedBox(
                      width: double.infinity,
                      child:ElevatedButton(
                        onPressed: () {
                          print('Sign Up button pressed');
                       
                        },
                       
                        style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        

                        child: const Text(
                          'S\'inscire',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    )
                      ,
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Déjà un compte?',
                          style: TextStyle(
                            color: AppColors.grayFineColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          child: const Text(
                            " Connectez-vous",
                            style: TextStyle(
                              color: AppColors.primary,
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
