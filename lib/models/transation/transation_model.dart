import 'package:flutter_money_magement_app/models/category/category_models.dart';
import 'package:hive/hive.dart';



@HiveType(typeId: 2)
class TransationModel {
  final String purpose;
  final double amount;
  final DateTime date;
  final CatrgoryType type;
  final CategoryModel category;
  TransationModel({
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });
}
