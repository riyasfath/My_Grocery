import 'package:hive/hive.dart';

import '../../model/category.dart';



class LocalCategoryService{
  late Box<Categories> _popularCategoryBox;

  Future<void> init() async{
    _popularCategoryBox = await Hive.openBox<Categories>('Popular Categories');
  }
  Future<void> assignAllPopularCategories({required List<Categories> popularCategories})async{
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }
  List<Categories> getPopularCategories() => _popularCategoryBox.values.toList();
}