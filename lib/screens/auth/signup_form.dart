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
  bool _obscurePassword = true; 

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Input(
          controller: _emailController,
          labelText: 'Email',
          
          prefixIcon: const Icon(Icons.email, color: AppColors.grayFineColor),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => debugPrint('Email: $value'),
        ),
        const SizedBox(height: 16),
        Input(
          controller: _passwordController,
          labelText: 'PassWord',
          prefixIcon: const Icon(Icons.lock, color: AppColors.grayFineColor),
          suffixIcon: Icon(
            _obscurePassword ? Icons.visibility_off : Icons.visibility,
            color: AppColors.grayFineColor,
          ),
          obscureText: _obscurePassword,
          onChanged: (value) => debugPrint('Password: $value'),
          onSuffixIconPressed: () {
            setState(() {
              _obscurePassword = !_obscurePassword;
            });
          },
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
    );
  }
}