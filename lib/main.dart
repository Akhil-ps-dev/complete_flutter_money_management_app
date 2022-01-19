import 'package:flutter/material.dart';
import 'package:flutter_money_magement_app/bottomnavi/bottomnavi.dart';
import 'package:flutter_money_magement_app/models/category/category_models.dart';
import 'package:flutter_money_magement_app/pages/transaction/add_transation/screen_add_transaction.dart';
import 'package:flutter_money_magement_app/widgets/screen_home.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CatrgoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CatrgoryTypeAdapter());
  }

  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenHome(),
      routes: {
      ScreenAddTransaction.routeName:(ctx)=>const ScreenAddTransaction()
      },
    );
  }
}
