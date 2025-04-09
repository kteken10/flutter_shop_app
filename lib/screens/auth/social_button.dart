import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../ui/button.dart';

class SocialButtons extends StatelessWidget {
  final VoidCallback? onApplePressed;
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onGuestPressed;

  const SocialButtons({
    super.key,
    this.onApplePressed,
    this.onGooglePressed,
    this.onFacebookPressed,
    this.onGuestPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Ligne "OR"
        _buildDividerWithText('OR'),
        const SizedBox(height: 20),

        // Boutons sociaux
        Button(
          icon: Icons.apple,
          text: 'Continue With Apple',
          onPressed: onApplePressed ?? () {},
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
        const SizedBox(height: 10),
        Button(
          icon: Icons.g_mobiledata,
          text: 'Continue With Google',
          onPressed: onGooglePressed ?? () {},
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
        const SizedBox(height: 10),
        Button(
          icon: Icons.facebook,
          text: 'Continue With Facebook',
          onPressed: onFacebookPressed ?? () {},
          backgroundColor: Colors.white,
          textColor: Colors.black,
        ),
        const SizedBox(height: 20),

        // Ligne "OR Continue as a guest"
        _buildDividerWithText(
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'OR Continue as a ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'guest',
                  style: TextStyle(
                    color: AppColors.ternary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDividerWithText(dynamic text) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.grayFineColor.withOpacity(0.4),
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: text is String
              ? Text(
                  text,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : text,
        ),
        Expanded(
          child: Divider(
            color: AppColors.grayFineColor.withOpacity(0.4),
            thickness: 1,
          ),
        ),
      ],
    );
  }
}