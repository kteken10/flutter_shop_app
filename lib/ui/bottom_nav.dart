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
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: GNav(
              backgroundColor: Colors.white,
              rippleColor: AppColors.primary.withOpacity(0.1),
              hoverColor: AppColors.primary.withOpacity(0.1),
              gap: 8,
              activeColor: Colors.white, // Couleur icône active
              color: Colors.black, // Couleur icône inactive
              iconSize: 26,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              duration: const Duration(milliseconds: 300),
              tabBackgroundColor: AppColors.primary, // Fond de l'onglet actif
              tabs: [
                GButton(
                  icon: _selectedIndex == 0
                      ? MdiIcons.home
                      : MdiIcons.homeOutline,
                ),
                GButton(
                  icon: _selectedIndex == 1
                      ? MdiIcons.cart
                      : MdiIcons.cartOutline,
                ),
                GButton(
                  icon: _selectedIndex == 2
                      ? MdiIcons.heart
                      : MdiIcons.heartOutline,
                ),
                GButton(
                  icon: _selectedIndex == 3
                      ? MdiIcons.account
                      : MdiIcons.accountOutline,
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