import 'package:flutter/material.dart';
import 'package:my_app/function/db_functions.dart';
import 'package:my_app/stastitics/statistics.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: searchQueryController,
        onChanged: (quary) {},
        decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  overViewGraphNotifier.value =
                      TransactionDB.instance.transactionListNotifier.value;
                  searchQueryController.clear();
                },
                icon: Icon(
                  Icons.close,
                ))),
      ),
    );
  }

  searchResult(String query) {
    if (query.isEmpty || query == '') {
      debugPrint(query);
      overViewGraphNotifier.value =
          TransactionDB.instance.transactionListNotifier.value;
    } else {
      overViewGraphNotifier.value = overViewGraphNotifier.value
          .where((element) =>
              element.category
                  .toLowerCase()
                  .contains(query.trim().toLowerCase()) ||
              element.explain.contains(query.trim().toLowerCase()))
          .toList();
    }
  }
}
