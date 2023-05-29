import 'package:get/get.dart';

class DashboardController extends GetxController{
  var tableIndex =0;

  void updateIndex(int index){
    tableIndex = index;
    update();
  }
}