import 'package:hive/hive.dart';
import 'package:my_app/model/add_data.dart';

int totals = 0;

final box = Hive.box<add_data>('data');

int total() {
  var history2 = box.values.toList();
  List a = [0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].IN == 'Income'
        ? int.parse(history2[i].amount)
        : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int income() {
  var history2 = box.values.toList();
  List a = [0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].IN == 'Income' ? int.parse(history2[i].amount) : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int expenses() {
  var history2 = box.values.toList();
  List a = [0];
  for (var i = 0; i < history2.length; i++) {
    a.add(history2[i].IN == 'Income' ? 0 : int.parse(history2[i].amount) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<add_data> today() {
  List<add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datatime.day == date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<add_data> week() {
  List<add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (date.day - 7 <= history2[i].datatime.day &&
        history2[i].datatime.day <= date.day) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<add_data> month() {
  List<add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datatime.month == date.month) {
      a.add(history2[i]);
    }
  }
  return a;
}

List<add_data> year() {
  List<add_data> a = [];
  var history2 = box.values.toList();
  DateTime date = new DateTime.now();
  for (var i = 0; i < history2.length; i++) {
    if (history2[i].datatime.year == date.year) {
      a.add(history2[i]);
    }
  }
  return a;
}
