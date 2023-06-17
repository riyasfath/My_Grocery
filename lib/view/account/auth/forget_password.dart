import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {


  TextEditingController forgetPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Forgot Password"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 250.0,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin:  const EdgeInsets.symmetric(horizontal: 30.0),
              child: TextFormField(
                controller: forgetPasswordController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.orange,
                  ),
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ),
             const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () async {

                  showToast();

                },

                style: ElevatedButton.styleFrom(
                    primary: Colors.orange, onPrimary: Colors.white),
                child: const Text(
                  "Forgot Password",


                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
  void showToast(){
   Fluttertoast.showToast(msg: 'Password sent to your Mail!',
   toastLength: Toast.LENGTH_SHORT,
   gravity: ToastGravity.CENTER,
   timeInSecForIosWeb: 1,
   backgroundColor: Colors.grey,
   textColor: Colors.white,
   fontSize: 16.0);
  }
}
