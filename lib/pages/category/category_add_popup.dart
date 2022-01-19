import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/db/category/transation/category_db.dart';
import 'package:flutter_money_magement_app/models/category/category_models.dart';

ValueNotifier<CatrgoryType> selectedCategoryNotifier =
    ValueNotifier(CatrgoryType.income);

Future<void> showCategoryAddPopUp(BuildContext context) async {
  final _nameEditingController = TextEditingController();
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: const Text('Add Category'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _nameEditingController,
                decoration: const InputDecoration(
                    hintText: 'Categorty Name', border: OutlineInputBorder()),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    RadioButton(title: 'Income', type: CatrgoryType.income),
                    RadioButton(title: 'Expense', type: CatrgoryType.expense),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    final _name = _nameEditingController.text;
                    if (_name.isEmpty) {
                      return;
                    } else {
                      final _type = selectedCategoryNotifier.value;
                      final _category = CategoryModel(
                          id: DateTime.now().millisecondsSinceEpoch.toString(),
                          name: _name,
                          type: _type);
                      CategoryDB.instance.insertCategory(_category);
                      Navigator.of(ctx).pop();
                    }
                  },
                  child: const Text('add')),
            )
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  final String title;
  final CatrgoryType type;

  const RadioButton({Key? key, required this.title, required this.type})
      : super(key: key);

  // final CatrgoryType selectedCategoryType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: selectedCategoryNotifier,
            builder: (BuildContext ctx, CatrgoryType newCategory, Widget? _) {
              return Radio<CatrgoryType>(
                  value: type,
                  groupValue: newCategory,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    selectedCategoryNotifier.value = value;
                    selectedCategoryNotifier.notifyListeners();
                  });
            }),
        Text(title)
      ],
    );
  }
}
