import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/db/category/transation/category_db.dart';
import 'package:flutter_money_magement_app/db/category/transation/transation_db.dart';
import 'package:flutter_money_magement_app/models/category/category_models.dart';
import 'package:flutter_money_magement_app/models/transation/transation_model.dart';

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

  final _purposeEditingController = TextEditingController();
  final _amountEditingController = TextEditingController();

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
              controller: _purposeEditingController,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Amount'),
              controller: _amountEditingController,
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
                return DropdownMenuItem(
                  value: e.id,
                  child: Text(e.name),
                  onTap: () {
                    _selectedcategoryModel = e;
                  },
                );
              }).toList(),
              onChanged: (selectedValue) {
                setState(() {
                  _categoryID = selectedValue;
                });
              },
            ),
            ElevatedButton.icon(
                onPressed: () {
                  addTransation();
                },
                icon: const Icon(
                  Icons.done,
                ),
                label: Text('Done'))
          ],
        ),
      )),
    );
  }

  Future<void> addTransation() async {
    final _purposeTextEdit = _purposeEditingController.text;
    final _amountTextEdit = _purposeEditingController.text;

    if (_purposeTextEdit.isEmpty) {
      return;
    }

    if (_amountTextEdit.isEmpty) {
      return;
    }

    if (_categoryID == null) {
      return;
    }

    if (_selectedcategoryModel == null) {
      return;
    }

    if (_selectedDate == null) {
      return;
    }

    final _parseAmount = double.tryParse(_amountTextEdit);

    if (_parseAmount == null) {
      return;
    }

    final _model = TransationModel(
        purpose: _purposeTextEdit,
        amount: _parseAmount,
        date: _selectedDate!,
        type: _selectedCategorytype!,
        category: _selectedcategoryModel!);

    TransactionDB.instance.addTransation(_model);
  }
}
