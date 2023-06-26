// import 'package:flutter/material.dart';
// import 'package:my_grocery/model/cartModel.dart';
// import 'package:my_grocery/view/cart/cart_helper.dart';
//
// class WishListScreen extends StatefulWidget {
//   const WishListScreen({Key? key, required List<CartModel> wishItems}) : super(key: key);
//
//   @override
//   State<WishListScreen> createState() => _WishListScreenState();
// }
//
// class _WishListScreenState extends State<WishListScreen> {
//   List<CartModel> wishItems = [];
//
//   @override
//   void initState() {
//     getCartItems();
//     super.initState();
//   }
//
//   Future getCartItems() async {
//     wishItems = await CartHelper().getCartItems(wishKey);
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: AppBar(
//         title: const Text('Wish List'),
//         backgroundColor: Colors.orange,
//       ),
//
//       body: ListView.builder(
//           itemCount: wishItems.length,
//           itemBuilder: (context, index) {
//
//
//
//             return ListTile(
//               title: Text(wishItems[index].name.toString()),
//               subtitle: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(wishItems[index].price.toString()),
//                   Text(wishItems[index].qty.toString()),
//                 ],
//               ),
//
//             );
//           }),
//       // )
//     ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/item_adapter.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  Box<Item>? wishlistBox;
  List<Item> selectedItems = [];

  @override
  void initState() {
    openWishlistBox();
    super.initState();
  }

  Future<void> openWishlistBox() async {
    wishlistBox = await Hive.openBox<Item>('wishlistItems');
  }

  void _removeFromWishlist() {
    final itemsToRemove = List<Item>.from(selectedItems);
    selectedItems.clear();

    // Remove the selected items from the wishlist box
    wishlistBox?.deleteAll(itemsToRemove);

    Navigator.pop(context, itemsToRemove);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wishlist"),
      ),
      body: ListView.builder(
          itemCount: wishlistBox?.length ?? 0,
          itemBuilder: (context, index) {
            final item = wishlistBox?.getAt(index);
            if (item != null) {
              final isSelected = selectedItems.contains(item);

              return ListTile(
                title: Text(item.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Quantity : ${item.quantity}'),
                    Text('Price : \$${item.price.toStringAsFixed(2)}'),
                  ],
                ),
                onTap: () {
                  setState(() {
                    isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                  });
                },
                tileColor: isSelected ? Colors.grey[200] : null,
              );
            }
            return const SizedBox.shrink();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: selectedItems.isNotEmpty ? _removeFromWishlist : null,
        child: const Icon(Icons.delete),
      ),

    );
  }
}
