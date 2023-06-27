import 'package:flutter/material.dart';
import 'package:my_grocery/view/cart/buy_now_screen.dart';
import 'package:my_grocery/view/cart/wishListScreen.dart';

import '../../model/cartModel.dart';
import 'cart_helper.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

int counter = 0;

class _CartState extends State<Cart> {


  List<CartModel> cartItems = [];
  List<CartModel> wishItems = [];

  void initState() {
    getCartItems();
    super.initState();
  }

  Future getCartItems() async {
    cartItems = await CartHelper().getCartItems();
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
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];

                    return InkWell(
                      onTap: () {
                        wishItems.any((item) =>
                        item.name ==
                            cartItem.name)

                        ?  wishItems.removeWhere((element) =>
                        element.name ==
                            cartItem.name) :wishItems.add(cartItems[index]);


                        print('asdddddddd'+wishItems.length.toString());
                        setState(() {});
                      },
                      child: Container(
                        color:
                        wishItems.any((item) =>
                        item.name ==
                            cartItem.name) ? Colors.green : null,
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
                                      await CartHelper().addToCart(cart);
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
                                      // setState(() {
                                      //   cartItems[index].selected =
                                      //       !cartItems[index].selected;
                                      // });
                                      final cart = CartModel(
                                        img: cartItem.img,
                                        name: cartItem.name,
                                        price:
                                            cartItem.price! + cartItem.price!,
                                        qty: 1,
                                      );
                                      await CartHelper().addToCart(cart);
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
                    onPressed: ()async {
                      await CartHelper().addToWishList(wishItems);
                      wishItems.clear();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WishListScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    child: const Text("Add to favorites"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BuyNowScreen()));

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                    child: const Text('Buy Now'),
                  ),
                ],
              ),
            )

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     CircleAvatar(
            //       radius: 25,
            //       backgroundColor: Colors.grey.shade300,
            //       child: IconButton(
            //           onPressed: () {},
            //           icon: const Icon(
            //             Icons.add_shopping_cart_rounded,
            //             color: Colors.orange,
            //           )),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.all(10),
            //       child: SizedBox(
            //         height: 60,
            //         width: 300,
            //         child: ElevatedButton(
            //           style: const ButtonStyle(
            //               backgroundColor: MaterialStatePropertyAll<Color>(
            //                   Colors.orange)),
            //           onPressed: () {
            //             setState(() {
            //               // ShowAlert();
            //             });
            //           },
            //           child: const Text(
            //             "Buy Now",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 20,
            //                 fontWeight: FontWeight.bold,
            //                 letterSpacing: 1),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
