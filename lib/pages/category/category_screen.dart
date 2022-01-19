import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/db/category/transation/category_db.dart';
import 'package:flutter_money_magement_app/pages/category/expense_cat_list_view.dart';
import 'package:flutter_money_magement_app/pages/category/income_cat_list_view.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUi();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.orange,
          tabs: const [
            Tab(
              text: 'INCOME',
              icon: Icon(
                Icons.attach_money,
              ),
            ),
            Tab(text: 'EXPENSE', icon: Icon(Icons.moving_rounded))
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [IncomeCategoryList(), ExpenseCategoryList()],
          ),
        )
      ],
    );
  }
}
