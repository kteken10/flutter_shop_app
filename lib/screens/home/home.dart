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
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Shop',
              style: TextStyle(
                color: AppColors.grayFineColor,
                fontSize: 24,
              ),
            ),
            Container(
              padding: const EdgeInsetsDirectional.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1, color: AppColors.grayFineColor),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
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
              showSearchIcon: true,
              hintText: 'search',
            ),
           
            const SizedBox(height: 20),
           
        
             const SizedBox(height: 10),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              TextWidget(
              'Categories',
              style: TextStyle(
                color:Colors.black,
              ),

             ),
             Icon(
              Icons.remove_red_eye,
              color:  AppColors.primary
             )

              
             ],),
             const ProductCategory(
              categories: ["All","SmartPhone", "HeadPhone", "Laptop"],
            )
             
          ],
        ),
      ),
    );
  }
}
