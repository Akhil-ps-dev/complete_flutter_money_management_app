import 'package:flutter/widgets.dart';
import 'package:flutter_money_magement_app/models/category/category_models.dart';
import 'package:hive_flutter/hive_flutter.dart';

const CATEGORY_DB_NAME = 'category_database';

abstract class CategoryDbFunctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryID);
}

class CategoryDB implements CategoryDbFunctions {
  CategoryDB._internal();

  static CategoryDB instance = CategoryDB._internal();

  factory CategoryDB() {
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryListListiner =
      ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryListListiner =
      ValueNotifier([]);

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id,value);
    refreshUi();
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refreshUi() async {
    final _allCategories = await getCategories();
    incomeCategoryListListiner.value.clear();
    expenseCategoryListListiner.value.clear();

    await Future.forEach(_allCategories, (CategoryModel category) {
      if (category.type == CatrgoryType.income) {
        incomeCategoryListListiner.value.add(category);
      } else {
        expenseCategoryListListiner.value.add(category);
      }
    });
    incomeCategoryListListiner.notifyListeners();
    expenseCategoryListListiner.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String categoryID) async {
    final _categoryDB = await Hive.openBox<CategoryModel>(CATEGORY_DB_NAME);
    _categoryDB.delete(categoryID);
    refreshUi();
  }
}
