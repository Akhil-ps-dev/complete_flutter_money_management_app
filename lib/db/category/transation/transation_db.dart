import 'package:flutter_money_magement_app/models/transation/transation_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

const TRANSATION_DB_NAME = 'transaction-db';

abstract class TransationDbFunction {
  Future<void> addTransation(TransationModel obj);
}

class TransactionDB implements TransationDbFunction {
//instance
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();
  factory TransactionDB() {
    return instance;
  }
//
  @override
  Future<void> addTransation(TransationModel obj) async {
    final _db = await Hive.openBox<TransationModel>(TRANSATION_DB_NAME);
    _db.put(obj.id, obj);
  }
}
