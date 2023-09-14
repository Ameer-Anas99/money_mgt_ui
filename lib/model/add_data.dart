import 'package:hive/hive.dart';
part 'add_data.g.model';

@HiveType(typeId: 1)
class Add_data extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String explain;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String IN;
  @HiveField(4)
  DateTime datatime;
  Add_data(this.IN, this.amount, this.datatime, this.explain, this.name);
}
