import 'dart:convert';
import 'package:hive/hive.dart';

part 'category.g.dart';
List<Categories> popularCategoryFromJson(String val) => List<Categories>.from(json
    .decode(val)['data']
    .map((category) => Categories.popularCategoryFromJson(category)));
@HiveType(typeId: 2)
class Categories {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;

  Categories({required this.id, required this.name, required this.image});

  factory Categories.popularCategoryFromJson(Map<String, dynamic> data) =>
      Categories(
          id: data['id'],
          name: data['attributes']['category']['data']['attributes']['name'],
          image: data['attributes']['category']['data']['attributes']['image']
          ['data']['attributes']['url']);
}

