// import 'package:flutter/material.dart';
//
// class SignInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.orange, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Welcome',
//                   style: TextStyle(
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Sign in to continue',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 SizedBox(height: 32),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 32),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       labelStyle: TextStyle(color: Colors.white),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 32),
//                   child: TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       labelStyle: TextStyle(color: Colors.white),
//                       enabledBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 TextButton(
//                   onPressed: () {
//                     // Handle Forgot Password button press
//                   },
//                   child: Text(
//                     'Forgot password?',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 SizedBox(height: 32),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle Sign In button press
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.orange,
//                     padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Text(
//                     'Sign In',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         // Handle Back button press
//                       },
//                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                     ),
//                     SizedBox(width: 8),
//                     TextButton(
//                       onPressed: () {
//                         // Handle New User Sign Up button press
//                       },
//                       child: Text(
//                         'New User? Sign Up',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/extention/string_extention.dart';
import 'package:my_grocery/view/account/auth/forget_password.dart';
import 'package:my_grocery/view/home/home_screen.dart';

import '../../../components/input_ outline_button.dart';
import '../../../components/input_text_button.dart';
import '../../../components/input_text_field.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                 Text("Welcome,",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                const Text(
                  "Sign in to continue!",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
                const Spacer(
                  flex: 3,
                ),
                InputTextField(
                  title: 'Email',
                  textEditingController: emailController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    } else if (!value.isValidEmail) {
                      return "Please enter valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Password',
                  obsecureText: true,
                  textEditingController: passwordController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "This field can't be empty";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ForgetPassword()));
                      },
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
                 Spacer(),
                InputTextButton(
                  title: "Sign In", onClick: (){

                  if(_formKey.currentState!.validate()){
                    authController.signIn(email: emailController.text, password: passwordController.text);
                  }
                },
                ),
                const SizedBox(height: 10),
                InputOutlineButton(
                  title: "Back",
                  onClick: (){
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(
                  flex: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("I'm new user, "),
                    InkWell(
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text("Sign Up",
                        style: TextStyle(
                            color: Colors.blue
                        ),),
                    )
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}