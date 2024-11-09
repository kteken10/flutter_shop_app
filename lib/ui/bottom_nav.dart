import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Page 1', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Page 2', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Page 3', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Page 4', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom Navigation Bar'),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: GNav(
              gap: 8,
              activeColor: AppColors.primary, // Couleur pour l'icône et le texte actif
              iconSize: 22,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              duration: const Duration(milliseconds: 300),
            
              textStyle: const TextStyle(fontSize: 12),
              tabs: const [
                GButton(
                  
                  icon: FontAwesomeIcons.houseFire,
                  text: 'Home',
                  iconColor: Colors.black, // Gère la couleur de l'icône inactif
                ),
                GButton(
                   
                  icon: FontAwesomeIcons.cartShopping,
                  text: 'Shop',
                  iconColor: Colors.black, // Gère la couleur de l'icône inactif
                ),
                GButton(
                
                  icon: FontAwesomeIcons.bell,
                  text: 'Notifications',
                  iconColor: Colors.black, // Gère la couleur de l'icône inactif
                ),
                GButton(
                
                  icon: FontAwesomeIcons.user,
                  text: 'Profile',
                  iconColor: Colors.black, // Gère la couleur de l'icône inactif
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
