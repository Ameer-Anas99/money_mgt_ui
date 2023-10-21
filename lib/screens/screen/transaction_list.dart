import 'package:flutter/material.dart';
import 'package:my_app/function/db_functions.dart';
import 'package:my_app/transacrtion/transactions.dart';

ValueNotifier showCategory = ValueNotifier('All');

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  ValueNotifier showCategory = ValueNotifier('All');

  @override
  void initState() {
    overViewListNotifier.value =
        TransactionDB.instance.transactionListNotifier.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            color: Color.fromARGB(255, 95, 13, 109),
          ),
          title: const Text(
            'Transactions History',
            style: TextStyle(fontSize: 23),
          ),
        ),
        body: const Column(
          children: [
            Expanded(
              child: Transactions(),
            ),
          ],
        ),
      ),
    );
  }
}
