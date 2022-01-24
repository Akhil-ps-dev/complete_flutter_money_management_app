import 'package:hive/hive.dart';

import 'package:flutter_money_magement_app/models/category/category_models.dart';

part 'transation_model.g.dart';

@HiveType(typeId: 3)
class TransationModel {
  @HiveField(0)
  final String purpose;
  @HiveField(1)
  final double amount;
  @HiveField(2)
  final DateTime date;
  @HiveField(3)
  final CatrgoryType type;
  @HiveField(4)
  final CategoryModel category;
  @HiveField(5)
  String? id;

  TransationModel({
    required this.purpose,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  }) {
    id = DateTime.now().millisecondsSinceEpoch.toString();
  }
}
