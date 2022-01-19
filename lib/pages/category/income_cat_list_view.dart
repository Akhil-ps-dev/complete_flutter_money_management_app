import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/db/category/transation/category_db.dart';
import 'package:flutter_money_magement_app/models/category/category_models.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: CategoryDB().incomeCategoryListListiner,
        builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final category = newList[index];

              return Card(
                child: ListTile(
                  title: Text(category.name),
                  trailing: IconButton(
                      onPressed: () {
                        CategoryDB.instance.deleteCategory(category.id);

                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      )),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 10,
              );
            },
            itemCount: newList.length,
          );
        });
  }
}
