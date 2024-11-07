import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';  
import 'package:flutter/services.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;  // L'index de l'élément sélectionné

  final List<Widget> _pages = [
    // Les pages associées à chaque élément de la barre de navigation
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
        padding: const EdgeInsets.all(8.0),
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
              activeColor: Colors.white, 
              iconSize: 24, 
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), 
              duration: const Duration(milliseconds: 300),
              color: Colors.black, 
              tabBackgroundColor: Colors.blue.shade500, 
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.notifications,
                  text: 'Notifications',
                ),
                GButton(
                  icon: Icons.account_circle,
                  text: 'Profile',
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
