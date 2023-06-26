import 'package:hive/hive.dart';

part  'item_adapter.g.dart';



@HiveType(typeId: 0)

class Item extends HiveObject{
  @HiveField(0)
  final String name;

  @HiveField(1)

  final int quantity;

  @HiveField(2)
  final int price;

  Item({required this.name,required this.quantity,required this.price});
}