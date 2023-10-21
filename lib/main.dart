import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:my_app/function/db_functions.dart';
import 'package:my_app/model/add_data.dart';
import 'package:my_app/screens/widget/splashscreen.dart';

const saveKeyName = 'User logged in';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  await Hive.openBox<TransactionModel>(transactionDBName);

  runApp(const MyApp());
  TransactionDB().getAllTransactions();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CashMgt',
      home: ScreenSplash(),
    );
  }
}
