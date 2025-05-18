import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/ui/text.dart';

import '../../ui/category_circle.dart';
import '../../ui/product_category.dart';
import '../../ui/promo_carousel.dart';
import '../../ui/search_zone.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false, // Désactive la flèche par défaut
        title: Row(
          children: [
            // Flèche de retour à gauche
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                      color: AppColors.grayFineColor.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.ternary,
                  size: 20,
                ),
              ),
            ),
            // Texte "Shop" centré
            const Expanded(
              child: Center(
                child: Text(
                  'Shop',
                  style: TextStyle(
                    color: AppColors.ternary,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            // Icône panier à droite
           
             GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                   color: AppColors.grayFineColor.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                 child: const Icon(
                Icons.shopping_bag_outlined,
               color: AppColors.ternary,
              ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           SearchZone(
              controller: searchController,
              onCameraPressed: () => {},
              onMicPressed: () => {},
              spacing: 12.0,
            ), 
            const SizedBox(height: 20),
            const ProductCategory(
              categories: ["All","women", "men", "sport", "Laptop"],
            ),
            const SizedBox(height: 20),
            const PromoCarousel(),
            // Nouvelle ligne ajoutée ici
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.ternary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action pour "See All"
                    },
                    child: const TextWidget(
                      'See All',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.ternary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CategoryCircle(
  categories: const ["shoes", "bag","headphone","cosmetics","sunglasses"],
  onCategorySelected: (category) {
    
  },
  )
          ],
        ),
      ),
    );
  }
}