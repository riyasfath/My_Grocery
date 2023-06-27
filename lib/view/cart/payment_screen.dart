import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatelessWidget {
  const PaymentOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
        backgroundColor: Colors.orange[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select a Payment Option',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            GestureDetector(
              onTap: () {
                // Handle Google Pay payment option
              },
              child: const Card(
                elevation: 4.0,
                child: ListTile(
                  leading: Icon(Icons.payment),
                  title: Text('Google Pay'),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                //=============Wallet payment -==============
              },
              child: const Card(
                elevation: 4.0,
                child: ListTile(
                  leading: Icon(Icons.account_balance_wallet),
                  title: Text('Wallet'),
                ),
              ),

            ),

            SizedBox(height: 16.0),
            GestureDetector(
              onTap: (){
                // NetBanking payment option
              },
              child: Card(
                elevation: 4.0,
                child: ListTile(leading: Icon(
                  Icons.account_balance,

                ),
                  title: Text('Net Banking'),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: (){
                // Handle card payments
              },
              child: Card(
                elevation: 4.0,
                child: ListTile(
                  leading: Icon(
                    Icons.payments,
                  ),
                  title: Text('Debit/Credit card'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
