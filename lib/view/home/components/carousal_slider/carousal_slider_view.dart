import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/view/home/components/carousal_slider/banner_card.dart';

import '../../../../model/ad_banner.dart';

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
            items: _bannerList,
            options: CarouselOptions(autoPlay: true,
                aspectRatio: 16/9,
              viewportFraction: 1,
              onPageChanged: (index, reason){
              setState(() {
                _currentIndex =index;
              });
              }
            )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.bannerList.map((e) {
            int index =widget.bannerList.indexOf(e);
            return Container(
              width: 8,
              height: 8,
              margin:  const EdgeInsets.symmetric(vertical: 10,
              horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ?const Color.fromRGBO(0, 0, 0, 0.9)
                    : const Color.fromRGBO(0, 0, 0, 0.4)

              ),
            );
          }).toList()
        )
      ],
    );
  }
}
