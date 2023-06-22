import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
                      "Products",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
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
                    width: 20,
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
                    return ListTile(
                      leading: CircleAvatar(
                        foregroundImage: NetworkImage(cartItem.img.toString()),
                        backgroundImage: NetworkImage(cartItem.img),

                      ),

                      title: Text(cartItem.name ?? ""),
                      trailing:  Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(cartItem.qty.toString()),
                          Icon(Icons.check_circle, color: Colors.green), //
                          Text(cartItem.price.toString()),
                          Icon(Icons.check_circle, color: Colors.green), // // Example status icon
                        ],
                      ),






                    );


                  },
                ),

              ),
            ),
            // Expanded(
            //
            //   child: SizedBox(
            //     child: ListView.builder(
            //       itemCount: cartItems.length,
            //       itemBuilder: (context, index) {
            //         final cartItem = cartItems[index];
            //         return ListTile(
            //           leading: CircleAvatar(
            //             child: Text(cartItem.price.toString()),
            //
            //           ),
            //
            //           title: Text(cartItem.qty.toString()),
            //
            //
            //
            //
            //
            //
            //         );
            //
            //
            //       },
            //     ),
            //
            //   ),
            // ),
            //
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_shopping_cart_rounded,
                        color: Colors.orange.shade300,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.orange)),
                      onPressed: () {

                        void showToast(String message) {
                          Fluttertoast.showToast(
                            msg: message,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.orange,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
            //
            //
            //
                        setState(() {
                          showToast("This Option is not working");
                        },
            //
            //
                        );
                      },

                      child: const Text(
                        "Book now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );

  }

}
