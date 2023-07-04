// import 'package:flutter/material.dart';
// import 'package:my_grocery/view/cart/payments/debit_card_payment.dart';
//
// class PaymentOptionsScreen extends StatelessWidget {
//   const PaymentOptionsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment Options'),
//         backgroundColor: Colors.orange[800],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text(
//               'Select a Payment Option',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 24.0),
//             GestureDetector(
//               onTap: () {
//                 // Handle Google Pay payment option
//               },
//               child: const Card(
//                 elevation: 4.0,
//                 child: ListTile(
//                   leading: Icon(Icons.payment),
//                   title: Text('Google Pay'),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: () {
//                 //=============Wallet payment -==============
//               },
//               child: const Card(
//                 elevation: 4.0,
//                 child: ListTile(
//                   leading: Icon(Icons.account_balance_wallet),
//                   title: Text('Wallet'),
//                 ),
//               ),
//
//             ),
//
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: (){
//                 // NetBanking payment option
//               },
//               child: const Card(
//                 elevation: 4.0,
//                 child: ListTile(leading: Icon(
//                   Icons.account_balance,
//
//                 ),
//                   title: Text('Net Banking'),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => DebitCardPaymentScreen()));
//                 // Handle card payments
//               },
//               child: const Card(
//                 elevation: 4.0,
//                 child: ListTile(
//                   leading: Icon(
//                     Icons.payments,
//                   ),
//                   title: Text('Debit/Credit card'),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentOptionsScreen extends StatefulWidget {
  const PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentOptionsScreen> createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  var _razorpay = Razorpay();
  var amountController = TextEditingController();

  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CupertinoNavigationBar(
        middle: Text("Payments"),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: TextField(
                  controller: amountController,
                  decoration:
                      const InputDecoration(hintText: "Enter your amount")),
            ),
            CupertinoButton(
              color: Colors.grey,
              child: const Text("Pay Amount"),
              onPressed: () {
                // Make Payment
                var options = {
                  'key': 'rzp_test_N4MJdLfBtoatdt',

                  'amount': (int.parse(amountController.text) * 100).toString(), // 500.00 rs
                  'name': 'onDoor',
                  'description': 'Groceries',
                  'timeout': 300,
                  'prefill': {
                    'contact': '9496697204',
                    'email': 'riyasfath@gmail.com'
                  }
                };

                _razorpay.open(options);
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}
