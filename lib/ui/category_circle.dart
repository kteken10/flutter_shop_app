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
      height: 90, // Un peu plus haut pour mieux accommoder le texte
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  // Cercle avec image - version améliorée pour le centrage
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.grayFineColor,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        getImageForCategory(widget.categories[index]),
                        fit: BoxFit.cover,
                        width: 56,
                        height: 56,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
               
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
      case 'shoes':
        return 'assets/images/categories/shoes.jpg';
      case 'bag':
        return 'assets/images/categories/bag.jpeg';
      case 'headphone':
        return 'assets/images/categories/headphone.jpg';  
      case 'cosmetics':
        return 'assets/images/categories/cosmetics.jpg';  
      case 'sunglasses':
        return 'assets/images/categories/sunglasses.png';  
      default:
        return 'assets/images/categories/default.jpg';
    }
  }
}