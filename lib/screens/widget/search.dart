import 'package:flutter/material.dart';
import 'package:my_app/function/db_functions.dart';
import 'package:my_app/transacrtion/transactions.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchQueryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: TextField(
            controller: searchQueryController,
            onChanged: (query) {
              //print('$query');
              searchResult(query);
              // overViewListNotifier.notifyListeners();
            },
            decoration: InputDecoration(
                hintText: 'Search..',
                border: InputBorder.none,
                icon: const Icon(
                  Icons.search,
                  // color: textClr,
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      overViewListNotifier.value =
                          TransactionDB.instance.transactionListNotifier.value;
                      searchQueryController.clear();
                    },
                    icon: const Icon(
                      Icons.close,
                      // color: Colors.black,
                    ))),
          ),
        ),
      ),
    );
  }

  searchResult(String query) {
    //debugPrint('queryprinted  $query');
    if (query.isEmpty || query == '') {
      debugPrint(query);

      overViewListNotifier.value =
          TransactionDB.instance.transactionListNotifier.value;
    } else {
      overViewListNotifier.value = overViewListNotifier.value
          .where((element) =>
              element.category
                  .toLowerCase()
                  .contains(query.trim().toLowerCase()) ||
              element.explain.contains(query.trim().toLowerCase()))
          .toList();

      //TransactionDB().transactionListNotifier.notifyListeners();
    }
  }
}
