import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../ui/button.dart';
import '../../ui/input.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
            controller: _emailController,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) => debugPrint('Email: $value'),
          ),
          const SizedBox(height: 16),
          Input(
            controller: _passwordController,
            labelText: 'Password',
            obscureText: true,
            onChanged: (value) => debugPrint('Password: $value'),
          ),
          const SizedBox(height: 20),
          Button(
            text: 'Sign Up',
            onPressed: () {
              debugPrint('Submitted - Email: ${_emailController.text}');
              debugPrint('Submitted - Password: ${_passwordController.text}');
            },
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}