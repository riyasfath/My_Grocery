import 'package:hive/hive.dart';

import '../../model/category.dart';



class LocalCategoryService{
  late Box<Categories> _popularCategoryBox;
  late Box<Categories> _categoryBox;


  Future<void> init() async{
    _popularCategoryBox = await Hive.openBox<Categories>('Popular Categories');
    _categoryBox = await Hive.openBox<Categories>(' Categories');


  }
  Future<void> assignAllPopularCategories({required List<Categories> popularCategories})async{
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategories);
  }

  Future<void> assignAllCategories({required List<Categories> categories})async{
    await _categoryBox.clear();
    await _categoryBox.addAll(categories);
  }


  List<Categories> getPopularCategories() => _popularCategoryBox.values.toList();
  List<Categories> getCategories() => _categoryBox.values.toList();

}