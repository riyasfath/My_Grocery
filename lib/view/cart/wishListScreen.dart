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
    wishItems = await CartHelper().getWishItems();
    setState(() {});
  }

  //==============delete item=========================//

  void removeItems(List<int> indexes){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Wish Items'),
        backgroundColor: Colors.orange,
      ),

      // body: ListView.builder(
      //     itemCount: wishItems.length,
      //     itemBuilder: (context, index) {
      //       return ListTile(
      //         title: Text(wishItems[index].name.toString()),
      //         subtitle: Text(wishItems[index].price.toString()),
      //         trailing: Text(wishItems[index].qty.toString()),
      //       );
      //     }),
      // )

      body: ListView.builder(
          itemCount: wishItems.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(

                title: Text(
                  wishItems[index].name.toString(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    'Rs. \$${wishItems[index].price?.toStringAsFixed(2)} | Quantity: ${wishItems[index].qty}'),
                leading: const Icon(Icons.favorite, color: Colors.orange),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ),
            );
          }),


    ));
  }
}
