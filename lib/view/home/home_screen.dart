import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/components/main_header.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/view/home/components/carousal_slider/carousal_slider_view.dart';
import 'package:my_grocery/view/home/components/carousal_slider/carousel_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Obx(() {
            if (homeController.bannerList.isNotEmpty) {
              return CarouselSlideView(bannerList: homeController.bannerList);
            } else {
              return CarouselLoading(

              );
            }
          })
        ],
      ),
    );
  }
}
