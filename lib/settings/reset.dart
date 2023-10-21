import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/function/db_functions.dart';
import 'package:my_app/model/add_data.dart';
import 'package:my_app/screens/widget/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class reset extends ChangeNotifier {
  resetApp(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Text(
              'Do you want to Reset app',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            actions: [
              TextButton(
                onPressed: (() async {
                  Navigator.of(context).pop();
                  final transactionDb =
                      await Hive.openBox<TransactionModel>(transactionDBName);
                  transactionDb.clear();
                  TransactionDB().transactionListNotifier.value.clear();
                  TransactionDB().transactionListNotifier.notifyListeners();

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => ScreenLogin(),
                    ),
                  );

                  SharedPreferences prefe =
                      await SharedPreferences.getInstance();
                  await prefe.clear();
                }),
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'No',
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          );
        });
  }
}
