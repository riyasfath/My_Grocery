import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_grocery/components/main_header.dart';
import 'package:my_grocery/view/product/components/product_grid.dart';
import 'package:my_grocery/view/product/components/product_loading.dart';

import '../../controller/product_controller.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Column(
        children: [
          MainHeader(),
          Expanded(child: Obx((){
            if(ProductController.productList.isNotEmpty){
              return ProductGrid(products: ProductController.productList)
            }else{
              return const ProductLoadingGrid();
            }
          })
          )
        ],
      ),
    );
  }
}
