import 'package:flutter/material.dart';
import 'package:myshop/screens/auth/signup_form.dart';
import 'package:myshop/screens/auth/social_button.dart';
import '../../constants/colors.dart';
import '../../ui/button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final viewInsets = MediaQuery.of(context).viewInsets;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Stack(
          children: [
            
            Container(
              height: screenSize.height,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary.withOpacity(0.5),
                    AppColors.primary.withOpacity(0.4),
                    AppColors.primary.withOpacity(0.4),
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

          
            Positioned(
              top: screenSize.height * 0.5, 
              bottom: 0, // S'étend jusqu'en bas
              left: 0,
              right: 0,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    controller: _scrollController,
                    physics: const ClampingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight, // Force la hauteur minimale
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Login/Signup buttons
                            Row(
                              children: [
                                Expanded(
                                  child: Button(
                                    text: 'Login',
                                    onPressed: () => setState(() => isLogin = true),
                                    backgroundColor: isLogin ? AppColors.primary : AppColors.white,
                                    textColor: isLogin ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Button(
                                    text: 'Sign Up',
                                    onPressed: () => setState(() => isLogin = false),
                                    backgroundColor: !isLogin ? AppColors.primary : AppColors.white,
                                    textColor: !isLogin ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),

                            // Dynamic content
                            isLogin
                                ? const SocialButtons(
                                    onApplePressed: null,
                                    onFacebookPressed: null,
                                    onGooglePressed: null,
                                    onGuestPressed: null,
                                  )
                                : const SignUpForm(),
                            
                            // Espace supplémentaire pour le clavier
                            SizedBox(height: viewInsets.bottom),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}