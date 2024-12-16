import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';

class ProductCategory extends StatelessWidget {
  final List<String> categories;

  const ProductCategory({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.black),
             ),
              child: Center(
                child: Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
