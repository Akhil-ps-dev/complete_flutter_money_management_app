import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/widgets/screen_home.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
 

  @override
  Widget build(BuildContext context) {
    return
       
        ValueListenableBuilder(
      valueListenable: ScreenHome.sletedIndexNotifier,
      builder: (BuildContext ctx, int updatedIndex, Widget? _) {
        return BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey[700],
          onTap: (newIndex) {
            ScreenHome.sletedIndexNotifier.value = newIndex;
          },
          currentIndex: updatedIndex,
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
        );
      },
    );
  }
}
