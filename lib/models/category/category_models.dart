import 'package:hive_flutter/adapters.dart';
part 'category_models.g.dart';

@HiveType(typeId: 2)
enum CatrgoryType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final bool isDeleted;
  @HiveField(3)
  final CatrgoryType type;

  CategoryModel({
    required this.id,
    required this.name,
    this.isDeleted = false,
    required this.type,
  });



 
}
