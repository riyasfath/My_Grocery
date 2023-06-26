import 'package:flutter/material.dart';
import 'package:my_grocery/model/item_adapter.dart';
import 'package:my_grocery/view/cart/buy_now_screen.dart';
import 'package:my_grocery/view/cart/wishListScreen.dart';
import 'package:hive/hive.dart';
import '../../model/cartModel.dart';
import 'cart_helper.dart';

import 'package:path_provider/path_provider.dart' as path_provider;

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

int counter = 0;

class _CartState extends State<Cart> {
  final String cartBoxName = 'cartItems';
  Box<Item>? cartBox;

  List<CartModel> cartItems = [];

  List<Item> selectedItems = [];

  bool isSelected(Item item){
    return selectedItems.contains(item);
  }

  void initState() {
    getCartItems();
    openCartBox();
    super.initState();
  }

  Future<void> openCartBox() async {
    final appDecumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDecumentDir.path);
    Hive.registerAdapter<Item>(ItemAdapter());
    cartBox = await Hive.openBox<Item>(cartBoxName);
  }

  void _moveToWishList() {
    final itemsToMove = List<Item>.from(selectedItems);
    selectedItems.clear();

    //store the selected items in the wishlist box

    final wishlistBox = Hive.box<Item>('wishlistItems');
    wishlistBox.addAll(itemsToMove);

    // Remove the selected items from the cart box
    cartBox?.deleteAll(itemsToMove);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WishListScreen(),
        )).then((value) {
      if (value != null && value is List<Item>) {
        setState(() {
          selectedItems = value;
        });
      }
    });
  }

  @override
  void dispose() {
    cartBox?.close();
    Hive.close();
    super.dispose();
  }

  Future getCartItems() async {
    cartItems = await CartHelper().getCartItems(cartKey);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Add Product',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      "Name",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("qty"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("price"),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 60,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  // itemCount: cartItems.length,
                  itemCount: cartBox!.length,
                  
                  itemBuilder: (context, index) {
                    
                    final item=cartBox!.getAt(index)
                    
                    // bool isSelected = cartItems[index].selected;
                    // final cartItem = cartItems[index];

                    bool isSelected = cartItems[index].selected;
                    final cartItem = cartItems[index];

                    return InkWell(
                      onTap: () {
                        setState(() {
                          cartItems[index].selected = !isSelected;
                        });
                      },
                      child: Container(
                        color: isSelected ? Colors.green : null,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              //   child: Image.network(
                              //    cartItem.img,
                              //    height: 100,
                              //    width: 100,
                              // ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                cartItem.name ?? "",
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("${cartItem.qty}"),
                            const SizedBox(
                              width: 10,
                            ),
                            Text("${cartItem.price}"),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final cart = CartModel(
                                        img: cartItem.img,
                                        name: cartItem.name,
                                        price:
                                            cartItem.price! - cartItem.price!,
                                        qty: -1,
                                      );
                                      await CartHelper()
                                          .addToCart(cart, cartKey);
                                      getCartItems();
                                    },
                                    child: const CircleAvatar(
                                      radius: 10,
                                      child: Center(
                                          child: Icon(
                                        Icons.remove,
                                        size: 15,
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      setState(() {
                                        cartItems[index].selected =
                                            !cartItems[index].selected;
                                      });
                                      final cart = CartModel(
                                        img: cartItem.img,
                                        name: cartItem.name,
                                        price:
                                            cartItem.price! + cartItem.price!,
                                        qty: 1,
                                      );
                                      await CartHelper()
                                          .addToCart(cart, cartKey);
                                      getCartItems();
                                    },
                                    child: const CircleAvatar(
                                      radius: 10,
                                      child: Center(
                                          child: Icon(
                                        Icons.add,
                                        size: 15,
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WishListScreen(),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    child: const Text("Move to Wishlist"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BuyNowScreen(),));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    child: const Text('Buy NOw'),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
