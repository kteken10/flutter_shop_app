import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';  
import '../constants/colors.dart';
import '../screens/favorite/favorite.dart';
import '../screens/home/home.dart';
import '../screens/profile/profile.dart';
import '../screens/shop/shop.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ShopScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
      
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          
          ),
          child: ClipRRect(
          
            borderRadius: BorderRadius.circular(30),
            child: GNav(
              backgroundColor: Colors.white,
              // gap: 8,
              activeColor: AppColors.primary, // Couleur pour l'icône et le texte actif
              iconSize: 28,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              duration: const Duration(milliseconds: 300),
              textStyle: const TextStyle(fontSize: 12),
              tabs: [
                // Home Tab
                GButton(
                  icon: _selectedIndex == 0
                      ? MdiIcons.home  // Version solide
                      : MdiIcons.homeOutline,  // Version outline
                  text: 'Home',
                  iconColor: Colors.black,
                ),
                
                // Shop Tab
                GButton(
                  icon: _selectedIndex == 1
                      ? MdiIcons.cart  // Version solide
                      : MdiIcons.cartOutline,  // Version outline
                  text: 'Shop',
                  iconColor: Colors.black,
                ),
                
                // Favorites Tab
                GButton(
                  icon: _selectedIndex == 2
                      ? MdiIcons.heart  // Version solide
                      : MdiIcons.heartOutline,  // Version outline
                  text: 'Favorites',
                  iconColor: Colors.black,
                ),
                
                // Profile Tab
                GButton(
                  icon: _selectedIndex == 3
                      ? MdiIcons.account  // Version solide
                      : MdiIcons.accountOutline,  // Version outline
                  text: 'Profile',
                  iconColor: Colors.black,
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}