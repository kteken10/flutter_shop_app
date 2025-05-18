import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProductCategory extends StatefulWidget {
  final List<String> categories;

  const ProductCategory({
    super.key,
    required this.categories,
  });

  @override
  State<ProductCategory> createState() => _ProductCategoryState();
}

class _ProductCategoryState extends State<ProductCategory> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
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
              // Tu peux déclencher ici un callback ou une fonction de filtrage si besoin
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary.withOpacity(0.05) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: isSelected ? AppColors.primary.withOpacity(0.1) : AppColors.grayFineColor,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getIconForCategory(widget.categories[index], isSelected),
                  const SizedBox(width: 8),
                  Text(
                    widget.categories[index],
                    style: TextStyle(
                      color: isSelected ? AppColors.primary : AppColors.gray,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
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

Icon getIconForCategory(String category, bool isSelected) {
    Color iconColor = isSelected ? AppColors.primary : AppColors.gray;

    switch (category.toLowerCase()) {
      case 'all':
        return Icon(Icons.grid_view_rounded, color: iconColor, size: 18);
      case 'women':
        return Icon(Icons.woman, color: iconColor, size: 18);
      case 'men':
        return Icon(Icons.man, color: iconColor, size: 18);
      case 'sport':
        return Icon(Icons.sports_basketball, color: iconColor, size: 18);
      default:
        return Icon(Icons.category_outlined, color: iconColor, size: 18);
    }
  }

}
