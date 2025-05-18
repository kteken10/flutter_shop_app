import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CategoryCircle extends StatefulWidget {
  final List<String> categories;
  final Function(String)? onCategorySelected;

  const CategoryCircle({
    super.key,
    required this.categories,
    this.onCategorySelected,
  });

  @override
  State<CategoryCircle> createState() => _CategoryCircleState();
}

class _CategoryCircleState extends State<CategoryCircle> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Augmenté pour accommoder les cercles
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              if (widget.onCategorySelected != null) {
                widget.onCategorySelected!(widget.categories[index]);
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Cercle avec image
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : Colors.transparent,
                        width: 2,
                      ),
                      image: DecorationImage(
                        image: AssetImage(getImageForCategory(widget.categories[index])),
                        fit: BoxFit.cover,
                        

                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Texte de la catégorie
                  Text(
                    widget.categories[index],
                    style: TextStyle(
                      color: isSelected ? AppColors.primary : AppColors.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String getImageForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'Shoes':
        return 'assets/images/categories/shoes.jpg';
      case 'Bag':
        return 'assets/images/categories/bag.jpeg';
      case 'men':
        return 'assets/images/categories/men.jpg';
      case 'sport':
        return 'assets/images/categories/sport.jpg';
      case 'laptop':
        return 'assets/images/categories/laptop.jpg';
      default:
        return 'assets/images/categories/default.jpg';
    }
  }
}