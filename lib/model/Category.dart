import 'dart:convert';

List<Categories> popularCategoryFromJson(String val) => List<Categories>.from(json
    .decode(val)['data']
    .map((category) => Categories.popularCategoryFromJson(category)));

class Categories {
  final int id;
  final String name;
  final String image;

  Categories({required this.id, required this.name, required this.image});

  factory Categories.popularCategoryFromJson(Map<String, dynamic> data) =>
      Categories(
          id: data['id'],
          name: data['attributes']['category']['data']['attributes']['name'],
          image: data['attributes']['category']['data']['attributes']['image']
              ['data']['attributes']['url']);
}
