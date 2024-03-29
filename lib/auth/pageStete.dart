import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/auth/otp/login.dart';
import 'package:test/auth/login_otp.dart';

class HomepageStete extends StatefulWidget {
  const HomepageStete({super.key});

  @override
  State<HomepageStete> createState() => _HomepageSteteState();
}

class _HomepageSteteState extends State<HomepageStete> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return LoginScreen();
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
