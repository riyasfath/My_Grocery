import 'package:flutter/material.dart';
import 'package:my_grocery/components/main_header.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          MainHeader(),
          Expanded(child: Column(

          ))
        ],
      ),
    );
  }
}
