import 'package:get/get.dart';

class DashboardController extends GetxController{
  static DashboardController instance = Get.find();

  var tableIndex =0;

  void updateIndex(int index){
    tableIndex = index;
    update();
  }
}