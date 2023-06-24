import 'package:flutter/material.dart';
import 'package:my_grocery/model/cartModel.dart';
import 'package:my_grocery/view/cart/cart_helper.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List<CartModel> wishItems = [];

  @override
  void initState() {
    getCartItems();
    super.initState();
  }

  Future getCartItems() async {
    wishItems = await CartHelper().getCartItems(wishKey);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Wish List'),
        backgroundColor: Colors.orange,
      ),

      body: ListView.builder(
          itemCount: wishItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(wishItems[index].name.toString()),
              subtitle: Text(wishItems[index].price.toString()),
              trailing: Text(wishItems[index].qty.toString()),
            );
          }),
      // )
    ));
  }
}
