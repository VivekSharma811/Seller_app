import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seller_app/global/global.dart';
import 'package:seller_app/home/home_screen.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/error_dialog.dart';
import '../widgets/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validate() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      loginSeller();
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return const ErrorDialog(
                message: "Please enter Email and Password");
          });
    }
  }

  loginSeller() async {
    showDialog(
        context: context,
        builder: (c) {
          return const LoadingDialog(message: "Authenticating");
        });

    User? currentUser;

    await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim())
        .then((auth) {
      currentUser = auth.user!;
    }).catchError((error) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(message: error.message.toString());
          });
    });

    if (currentUser != null) {
      fetchUserDetails(currentUser!).then((value) {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (c) => const HomeScreen()));
      });
    }
  }

  Future<void> fetchUserDetails(User currentUser) async {
    await FirebaseFirestore.instance
        .collection("sellers")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
      await sharedPreferences!.setString("sellerUID", currentUser.uid);
      await sharedPreferences!
          .setString("sellerName", snapshot.data()!["sellerName"]);
      await sharedPreferences!.setString(
          "sellerProfilePicture", snapshot.data()!["sellerProfilePicture"]);
      await sharedPreferences!
          .setString("sellerEmail", emailController.text.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                "images/seller.png",
                height: 270,
              ),
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    data: Icons.email,
                    controller: emailController,
                    hint: "Email",
                    isSecure: false,
                  ),
                  CustomTextField(
                    data: Icons.lock,
                    controller: passwordController,
                    hint: "Password",
                    isSecure: true,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      validate();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20)),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
