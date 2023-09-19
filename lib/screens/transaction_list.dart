import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/model/add_data.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final box = Hive.box<add_data>('data');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 11, 100, 79),
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: box.length,
        itemBuilder: (context, index) {
          final history = box.getAt(index);
          return Card(
            elevation: 10,
            child: ListTile(
              leading: CircleAvatar(
                radius: 13,
                backgroundColor: history!.IN == 'Income'
                    ? Color.fromARGB(255, 34, 141, 116)
                    : Color.fromARGB(255, 220, 53, 69),
                child: Icon(
                  history.IN == 'Income'
                      ? Icons.arrow_downward
                      : Icons.arrow_upward,
                  color: Colors.white,
                ),
              ),
              title: Text(
                history.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                '${history.datatime.day}-${history.datatime.month}-${history.datatime.year}',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                history.amount,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: history.IN == 'Income' ? Colors.green : Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
