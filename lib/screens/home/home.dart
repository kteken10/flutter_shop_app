import 'package:flutter/material.dart';
import 'package:myshop/constants/colors.dart';
import 'package:myshop/ui/text.dart';
import '../../ui/input_field.dart';
import '../../ui/product_category.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           InputField(
  controller: searchController,
  keyboardType: TextInputType.text,
  obscureText: false,
  showSearchIcon: true ,
  hintText: 'search',
  borderColor: AppColors.grayFineColor,
  suffixIcon: IconButton(
    icon: const Icon(Icons.mic, color: AppColors.gray),
    onPressed: () {
     
    },
  ),
),
            const SizedBox(height: 20),
          
            const ProductCategory(
              categories: ["All", "SmartPhone", "HeadPhone", "Laptop"],
            ),
          ],
        ),
      ),
    );
  }
}