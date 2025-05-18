import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProductShow extends StatelessWidget {
  final String imagePath;
  final String price;
  final String? productName;
  final String? category;
  final double? rating;
  final double? borderRadius;
  final Color? backgroundColor;

  const ProductShow({
    super.key,
    required this.imagePath,
    required this.price,
    this.productName,
    this.category,
    this.rating,
    this.borderRadius = 12.0,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
        border: Border.all(
          color: AppColors.grayFineColor,
          width: 1.0,
        ),
      ),
      margin: const EdgeInsets.all(4),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image
              AspectRatio(
                aspectRatio: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(borderRadius!),
                  ),
                  child: Container(
                    color: AppColors.grayFineColor.withOpacity(0.1),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.image_not_supported)),
                    ),
                  ),
                ),
              ),
              // Infos
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (productName != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          productName!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (category != null || rating != null)
                      Row(
                        children: [
                          if (category != null)
                            Expanded(
                              child: Text(
                                category!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          if (rating != null) ...[
                            if (category != null) const SizedBox(width: 8),
                            Text(
                              rating.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                          ],
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          // Icône chariot en haut à droite
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black87,
                size: 20,
              ),
            ),
          ),
          // Prix en intersection
          Positioned(
            right: 4,
            top: null,
            bottom: 50, // Ajuste cette valeur pour l'effet d'intersection
            child: Material(
              color: AppColors.white,
              elevation: 2,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}