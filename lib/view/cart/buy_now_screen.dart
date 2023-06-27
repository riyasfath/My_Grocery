// import 'package:flutter/material.dart';
// import 'package:my_grocery/view/cart/payment_screen.dart';
//
// import '../../const.dart';
// import '../../model/cartModel.dart';
// import 'address_screen.dart';
// import 'cart_helper.dart';
//
// class BuyNowScreen extends StatefulWidget {
// final  CartModel buyItems;
//   const BuyNowScreen({required this.buyItems,Key? key}) : super(key: key);
//
//   @override
//   State<BuyNowScreen> createState() => _BuyNowScreenState();
// }
//
// class _BuyNowScreenState extends State<BuyNowScreen> {
//
//
//
//   @override
//   void initState() {
//     getCartItems();
//     super.initState();
//   }
//   Future getCartItems()async{
//     // buyItems = await CartHelper().getBuyItems();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.orange,
//       appBar: AppBar(
//         title: const Text('Buy Now'),
//         backgroundColor: Colors.orange[800],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              CircleAvatar(
//               radius: 150,
//               backgroundColor: Colors.white,
//               foregroundImage: NetworkImage(baseUrl+ widget.buyItems.img!),
//               child: const Icon(
//                 Icons.shopping_cart,
//                 size: 100.0,
//                 color: Colors.orange,
//               ),
//             ),
//             const SizedBox(height: 24.0),
//              Text(
//                widget.buyItems.name!,
//
//               style: const TextStyle(
//                   fontSize: 24.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 8.0,
//             ),
//              Text(
//               widget.buyItems.price!.toString(),
//               style: TextStyle(fontSize: 18.0, color: Colors.white),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(
//               height: 24.0,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentOptionsScreen()));
//               },
//               style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                   onPrimary: Colors.orange,
//                   padding: const EdgeInsets.symmetric(vertical: 16.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   )),
//               child: const Text(
//                 'Buy Now',
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//
//
//
//
//             ),
//             const SizedBox(height: 16.0),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: ElevatedButton(
//                 onPressed: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context) => const AdressScreen(),));
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                   onPrimary: Colors.orange,
//                   padding: const EdgeInsets.symmetric(vertical: 12.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   )
//                 ),
//                 child: const Text(
//                   'Delivery Address',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart';
import 'package:my_grocery/view/cart/payment_screen.dart';

import '../../model/cartModel.dart';
import 'cart_helper.dart';

class BuyNowScreen extends StatefulWidget {
  final CartModel buyItems;
  const BuyNowScreen({required this.buyItems, Key? key}) : super(key: key);

  @override
  _BuyNowScreenState createState() => _BuyNowScreenState();
}

class _BuyNowScreenState extends State<BuyNowScreen> {
  int _quantity = 1;
  String _address = '';

  @override
  void initState() {
    getCartItems();
    super.initState();
  }

  Future getCartItems() async {
    // buyItems = await CartHelper().getBuyItems();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[800],
        title: const Text('Buy Now'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              baseUrl + widget.buyItems.img,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.buyItems.name!.toString(),
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
             Text(
               widget.buyItems.price!.toString()
              ,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (_quantity > 1) {
                        _quantity--;
                      }
                    });
                  },
                ),
                Text(
                  'Quantity: $_quantity',
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _address = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),

            ElevatedButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentOptionsScreen()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text(
                  'BUY NOW',
                  style: TextStyle(

                    fontSize: 16.0,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
