import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/model/Category.dart';
import 'package:my_grocery/view/home/components/popular_category/popular_category_card.dart';
import 'package:my_grocery/view/home/components/popular_category/popular_category_loading_card.dart';

class PopularCategory extends StatelessWidget {

  final List<Categories> categ;
  const PopularCategory({Key? key,
    required this.categ

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics:  const BouncingScrollPhysics(),
          itemCount: categ.length,
          itemBuilder: (context, index) =>
              PopularCategoryCard(category: categ[index]
              ),
      ),
    );
  }
}
