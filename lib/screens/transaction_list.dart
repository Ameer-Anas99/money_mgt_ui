import 'package:flutter/material.dart';

class transaction_list extends StatefulWidget {
  const transaction_list({super.key});

  @override
  State<transaction_list> createState() => _transaction_listState();
}

class _transaction_listState extends State<transaction_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              elevation: 20,
              child: ListTile(
                  leading: CircleAvatar(
                      child: Image.asset('assets/category_img/education.jpeg')),
                  title: Text(
                    'Transfer',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  subtitle: Text(
                    'Today',
                    style: TextStyle(color: Color.fromARGB(255, 136, 133, 133)),
                  ),
                  trailing: Text(
                    '\$ 89',
                    style: TextStyle(
                        color: Color.fromARGB(255, 44, 160, 48),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
            );
          },
          itemCount: 10),
    );
  }
}
