import 'dart:convert';
import 'package:hive/hive.dart';

part 'ad_banner.g.dart';

List<AdBanner> adBannerListFromJson(String val) => List<AdBanner>.from(
    json.decode(val) ['data'].map((banner) => AdBanner.fromJson(banner))
);

@HiveType(typeId: 1)
class AdBanner{
  @HiveField(0)
  late final int id;
  @HiveField(1)
  late final String image;

  AdBanner({
    required this.id,
    required this.image
  });
  factory AdBanner.fromJson(Map<String, dynamic> data )=>
      AdBanner(id: data['id'], image: data['attributes']['image']
      ['data']['attributes']['url']
      );

}


// import 'dart:convert';
// import 'package:hive/hive.dart';
//
// part 'category.g.dart';
// List<Categories> popularCategoryFromJson(String val) => List<Categories>.from(json
//     .decode(val)['data']
//     .map((category) => Categories.popularCategoryFromJson(category)));
// @HiveType(typeId: 2)
// class Categories {
//   @HiveField(0)
//   final int id;
//   @HiveField(1)
//   final String name;
//   @HiveField(2)
//   final String image;
//
//   Categories({required this.id, required this.name, required this.image});
//
//   factory Categories.popularCategoryFromJson(Map<String, dynamic> data) =>
//       Categories(
//           id: data['id'],
//           name: data['attributes']['category']['data']['attributes']['name'],
//           image: data['attributes']['category']['data']['attributes']['image']
//           ['data']['attributes']['url']);
// }



// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'category.dart';
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class CategoryAdapter extends TypeAdapter<Categories> {
//   @override
//   final int typeId = 2;
//
//   @override
//   Categories read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Categories(
//       id: fields[0] as int,
//       name: fields[1] as String,
//       image: fields[2] as String,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, Categories obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.id)
//       ..writeByte(1)
//       ..write(obj.image);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is CategoryAdapter &&
//               runtimeType == other.runtimeType &&
//               typeId == other.typeId;
// }
//
