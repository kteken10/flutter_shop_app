import 'package:flutter/material.dart';
import 'package:myshop/ui/text.dart';

import '../../constants/colors.dart';

class SectionDetail extends StatefulWidget {
  const SectionDetail({Key? key}) : super(key: key);

  @override
  State<SectionDetail> createState() => _SectionDetailState();
}

class _SectionDetailState extends State<SectionDetail> {
  int selectedIndex = 0;

  final List<String> options = ['Description', 'How to use', 'Review'];

  final List<Widget> contents = [
    Text('Ceci est la description du produit.'),
    Text('Voici comment utiliser ce produit.'),
    Text('Avis des utilisateurs sur ce produit.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(options.length, (index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                children: [
                  Container(
                   padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextWidget(
                      options[index],
                      style: TextStyle(
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? AppColors.primary: Colors.black54,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    height: 3,
                    width: 40,
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
        const SizedBox(height: 16),
        contents[selectedIndex],
      ],
    );
  }
}