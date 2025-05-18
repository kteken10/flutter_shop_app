import 'package:flutter/material.dart';
import 'package:myshop/screens/product_detail/product_banner.dart';
import 'package:myshop/ui/text.dart';

import '../../constants/colors.dart';
import '../../ui/category_circle.dart';
import 'section_detail.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final String imagePath = args?['imagePath'] ?? '';
    final String price = args?['price'] ?? '';
    final String? productName = args?['productName'];
    final String? category = args?['category'];
    final double? rating = args?['rating'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Detail',
          style: TextStyle(
            color: AppColors.ternary,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            ProductBanner(price: price, imagePath: imagePath),
            const CategoryCircle(
              categories: ["shoes", "bag", "headphone", "cosmetics", "sunglasses"],
            ),
            if (category != null || rating != null) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (category != null)
                      TextWidget(
                        category!.toUpperCase(),
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    if (rating != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(
                            rating.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                        ],
                      ),
                  ],
                ),
              ),
            ],
           
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextWidget(
                  productName ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SectionDetail()
          ],
        ),
      ),
    );
  }
}