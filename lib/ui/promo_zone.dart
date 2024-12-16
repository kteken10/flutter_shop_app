import 'package:flutter/material.dart';
import 'package:myshop/ui/text.dart';

import '../constants/colors.dart';

class PromoZone extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final String text;

  const PromoZone({
    super.key,
    required this.imagePath,
    required this.text,
    this.backgroundColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text,
                    typeText: TextType.text2Xl,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Up To 50%',
                      style: TextStyle(
                        color: AppColors.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Image.asset(
            'assets/$imagePath',
          ),
        ],
      ),
    );
  }
}
