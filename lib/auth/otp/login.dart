import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/auth/login_otp.dart';
import 'package:test/auth/otp/otpScreen.dart';
import 'package:test/auth/profile.dart';

class PhooneNumber extends StatefulWidget {
  const PhooneNumber({super.key});

  @override
  State<PhooneNumber> createState() => _PhooneNumberState();
}

class _PhooneNumberState extends State<PhooneNumber> {
  TextEditingController _PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("mobile Number Otp "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         const Text("Enter Phone Number "),
          TextFormField(
            controller: _PhoneController,
             keyboardType: TextInputType.number,

            decoration: InputDecoration(hintText: "+91987543210"),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                    verificationCompleted: (PhoneAuthCredential credential) { print("verificationCompleted");},
                    verificationFailed: (FirebaseAuthException ex) { print("verificationFailed $ex");},
                    codeSent: (String verificationId, int? resendtoken) {
                      print("send otp");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OtpScreen(
                                    vreificationid: verificationId,
                                  )));
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                    
                    },
                    phoneNumber:"+91${_PhoneController.text.toString()}");
              },
              child: Text("SEND OTP"))
        ],
      ),
    );
  }
}
