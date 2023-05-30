import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/view/home/components/carousal_slider/banner_card.dart';

import '../../../../model/add_banner.dart';

class CarouselSlideView extends StatefulWidget {
  final List<AdBanner> bannerList;

  const CarouselSlideView({Key? key, required this.bannerList})
      : super(key: key);

  @override
  State<CarouselSlideView> createState() => _CarouselSlideViewState();
}

class _CarouselSlideViewState extends State<CarouselSlideView> {
  int _currentIndex = 0;
  late List<Widget> _bannerList;

  @override
  void initState() {
    _bannerList =
        widget.bannerList.map((e) => BannerCard(imageUrl: e.image)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            items: _bannerList, options: CarouselOptions(autoPlay: false))
      ],
    );
  }
}
