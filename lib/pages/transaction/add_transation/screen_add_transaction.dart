import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/db/category/transation/category_db.dart';
import 'package:flutter_money_magement_app/models/category/category_models.dart';

class ScreenAddTransaction extends StatefulWidget {
  const ScreenAddTransaction({Key? key}) : super(key: key);

  static const routeName = 'add-trans';

  @override
  State<ScreenAddTransaction> createState() => _ScreenAddTransactionState();
}

class _ScreenAddTransactionState extends State<ScreenAddTransaction> {
  DateTime? _selectedDate;
  CatrgoryType? _selectedCategorytype;
  CategoryModel? _selectedcategoryModel;
  String? _categoryID;

  @override
  void initState() {
    _selectedCategorytype = CatrgoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(hintText: 'Purpose'),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Amount'),
            ),

            ///date

            TextButton.icon(
                onPressed: () async {
                  final _selectedDateTemp = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate:
                          DateTime.now().subtract(const Duration(days: 30)),
                      lastDate: DateTime.now());
                  if (_selectedDateTemp == null) {
                    return;
                  } else {
                    setState(() {
                      _selectedDate = _selectedDateTemp;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: Text(_selectedDate == null
                    ? 'Select Date'
                    : _selectedDate!.toString())),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Radio(
                        value: CatrgoryType.income,
                        groupValue: _selectedCategorytype,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCategorytype = CatrgoryType.income;
                            _categoryID = null;
                          });
                        }),
                    Text('Income')
                  ],
                ),
                Row(
                  children: [
                    Radio(
                        value: CatrgoryType.expense,
                        groupValue: _selectedCategorytype,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedCategorytype = CatrgoryType.expense;
                            _categoryID = null;
                          });
                        }),
                    Text('Expense'),
                  ],
                ),
              ],
            ),
            DropdownButton<String>(
                hint: const Text('Select Category'),
                value: _categoryID,
                items: (_selectedCategorytype == CatrgoryType.income
                        ? CategoryDB().incomeCategoryListListiner
                        : CategoryDB().expenseCategoryListListiner)
                    .value
                    .map((e) {
                  return DropdownMenuItem(value: e.id, child: Text(e.name));
                }).toList(),
                onChanged: (selectedValue) {
                  setState(() {
                    _categoryID = selectedValue;
                  });
                }),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.done,
                ),
                label: Text('Done'))
          ],
        ),
      )),
    );
  }
}
