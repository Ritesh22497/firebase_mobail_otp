import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/auth/profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Future<FirebaseApp> _initializeFirebase() async {
  //   FirebaseApp firebaseApp =await Firebase.initializeApp();
  //   return firebaseApp;
  // }

  static Future<User?> loginUsingEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user not found") {
        print("no usr fond ");
      }
    }
    return user;
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page "),
      ),
      body: Column(
        children: [
          Text("Login "),
 TextFormField(
            controller: _emailController,
            // keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Phone number"),
          ),
          

          TextFormField(
            controller: _emailController,
            // keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter email"),
          ),
          TextFormField(
            controller: _PasswordController,
            // keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter password"),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () async {
                User? user = await loginUsingEmail(
                    email: _emailController.text,
                    password: _PasswordController.text,
                    context: context);
                if (user != null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                } else {
                  print("user data not found");
                }
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
