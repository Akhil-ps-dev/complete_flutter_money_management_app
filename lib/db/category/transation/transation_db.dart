import 'package:flutter/foundation.dart';
import 'package:flutter_money_magement_app/models/transation/transation_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const TRANSATION_DB_NAME = 'transaction-db';

abstract class TransationDbFunction {
  Future<void> addTransation(TransationModel obj);
  Future<List<TransationModel>> getAllTransations();
  Future<void> deleteTransation(String id);
}

class TransactionDB implements TransationDbFunction {
//instance
  TransactionDB._internal();

  static TransactionDB instance = TransactionDB._internal();
  factory TransactionDB() {
    return instance;
  }

  ValueNotifier<List<TransationModel>> transationListNotifier =
      ValueNotifier([]);

//
  @override
  Future<void> addTransation(TransationModel obj) async {
    final _db = await Hive.openBox<TransationModel>(TRANSATION_DB_NAME);
    await _db.put(obj.id, obj);
  }

  Future<void> refresh() async {
    final _list = await getAllTransations();
    _list.sort((first, second) => second.date.compareTo(first.date));
    transationListNotifier.value.clear();
    transationListNotifier.value.addAll(_list);
    transationListNotifier.notifyListeners();
  }

  @override
  Future<List<TransationModel>> getAllTransations() async {
    final _db = await Hive.openBox<TransationModel>(TRANSATION_DB_NAME);
    return _db.values.toList();
  }

  @override
  Future<void> deleteTransation(String id) async {
    final _db = await Hive.openBox<TransationModel>(TRANSATION_DB_NAME);

    await _db.delete(id);
    refresh();
  }
}
