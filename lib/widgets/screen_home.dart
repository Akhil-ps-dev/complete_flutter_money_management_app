import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/bottomnavi/bottomnavi.dart';
import 'package:flutter_money_magement_app/pages/category/category_add_popup.dart';
import 'package:flutter_money_magement_app/pages/category/category_screen.dart';
import 'package:flutter_money_magement_app/pages/settings/settings_screen.dart';
import 'package:flutter_money_magement_app/pages/transaction/add_transation/screen_add_transaction.dart';
import 'package:flutter_money_magement_app/pages/transaction/add_transation/transaction_screen.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  static ValueNotifier<int> sletedIndexNotifier = ValueNotifier(0);

  final _pages = const [
    TransactionScreen(),
    CategoryScreen(),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: sletedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Compose'),
        onPressed: () {
          if (sletedIndexNotifier.value == 0) {
            Navigator.of(context).pushNamed(ScreenAddTransaction.routeName);
            print('add trans');
          } else
            showCategoryAddPopUp(context);
        },
        icon: Icon(Icons.mode_edit_outlined),
      ),
    );
  }
}
