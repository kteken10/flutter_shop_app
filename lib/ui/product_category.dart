import 'package:flutter/material.dart';

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
            margin: const EdgeInsets.symmetric(horizontal: 4), // Espace entre les catégories
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getIconForCategory(categories[index]), // Icône personnalisée
                const SizedBox(width: 8), // Espacement entre l'icône et le texte
                Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Méthode pour obtenir une icône personnalisée en fonction de la catégorie
  Icon getIconForCategory(String category) {
    switch (category) {
      case 'All':
        return const Icon(Icons.category, color: Colors.black, size: 16);
      case 'SmartPhone':
        return const Icon(Icons.smartphone, color: Colors.black, size: 16);
      case 'HeadPhone':
        return const Icon(Icons.headphones, color: Colors.black, size: 16);
      case 'Laptop':
        return const Icon(Icons.laptop, color: Colors.black, size: 16);
      default:
        return const Icon(Icons.device_unknown, color: Colors.black, size: 16); // Icône par défaut
    }
  }
}
