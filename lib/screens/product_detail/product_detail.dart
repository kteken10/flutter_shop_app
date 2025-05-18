import 'package:flutter/material.dart';
import 'package:myshop/screens/product_detail/product_banner.dart';

import '../../constants/colors.dart';

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
      appBar: AppBar(title:const Text(
                  'Product Detail',
                  style: TextStyle(
                    color: AppColors.ternary,
                    fontSize: 20,
                  ),
                )),
      body: Container(
      
        child: Column(
          children: [
            // Image.asset(imagePath, height: 200),
            ProductBanner(price: price, imagePath: imagePath),
            const SizedBox(height: 16),
            Text(productName ?? '', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(price, style: const TextStyle(fontSize: 18, color: Colors.green)),
            if (category != null) ...[
              const SizedBox(height: 8),
              Text(category, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            ],
            if (rating != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating.toString(), style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, color: Colors.amber, size: 18),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}