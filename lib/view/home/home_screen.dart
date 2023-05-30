import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/components/main_header.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/home/components/carousel_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:
      Column(
        children: [
          MainHeader(),
          Obx((){
            if(homeController.isBannerLoading.value){
              return Carousal();

            }else {
              return Carousal();

            }
          })

        ],
      ),


    );
  }
}
