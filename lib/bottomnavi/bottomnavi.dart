import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/pages/category/category_screen.dart';
import 'package:flutter_money_magement_app/pages/settings_screen.dart';
import 'package:flutter_money_magement_app/pages/transaction/transaction_screen.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentIndex = 0;
  final screens = [
    TransactionScreen(),
    const CategoryScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey[700],
        onTap: (index) => setState(() => currentIndex = index),
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.attach_money,
              ),
              label: 'Transaction'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
              ),
              label: 'Category'),

     

          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings'),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.search,
          //     ),
          //     label: 'Explore'),
          // BottomNavigationBarItem(
          //     icon: Icon(
          //       Icons.settings,
          //     ),
          //     label: 'Settings'),
        ],
      ),
    );
  }
}
