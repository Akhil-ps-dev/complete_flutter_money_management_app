// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 1;

  @override
  CategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModel(
      id: fields[0] as String,
      name: fields[1] as String,
      isDeleted: fields[2] as bool,
      type: fields[3] as CatrgoryType,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.isDeleted)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CatrgoryTypeAdapter extends TypeAdapter<CatrgoryType> {
  @override
  final int typeId = 2;

  @override
  CatrgoryType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CatrgoryType.income;
      case 1:
        return CatrgoryType.expense;
      default:
        return CatrgoryType.income;
    }
  }

  @override
  void write(BinaryWriter writer, CatrgoryType obj) {
    switch (obj) {
      case CatrgoryType.income:
        writer.writeByte(0);
        break;
      case CatrgoryType.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatrgoryTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
