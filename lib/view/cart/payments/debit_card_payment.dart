import 'package:flutter/material.dart';

class DebitCardPaymentScreen extends StatefulWidget {
  @override
  _DebitCardPaymentScreenState createState() => _DebitCardPaymentScreenState();
}

class _DebitCardPaymentScreenState extends State<DebitCardPaymentScreen> {
  bool _showCardDetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debit Card Payment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showCardDetails = !_showCardDetails;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.orange),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: const Text(
                  'EnterCard Details',
                  style: TextStyle(

                    fontSize: 16.0,
                  ),
                )),
            // RaisedButton(
            //   onPressed: () {
            //     setState(() {
            //       _showCardDetails = !_showCardDetails;
            //     });
            //   },
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   child: Text('Enter Card Details'),
            // ),
            SizedBox(height: 16.0),
            if (_showCardDetails)
              Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Card Number',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Expiration Date',
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'CVV',
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      // RaisedButton(
                      //   onPressed: () {
                      //     // Place the logic for processing the payment here
                      //   },
                      //   color: Colors.green,
                      //   textColor: Colors.white,
                      //   child: Text('Pay Now'),
                      // ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                          ),
                          child: const Text(
                            'PAY NOW',
                            style: TextStyle(

                              fontSize: 16.0,
                            ),
                          )),
                    ]


                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


