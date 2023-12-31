// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:rk_big_basket/helper/route_helper.dart';

// class FirebaseController extends GetxController {
//   bool isWorkingOnOtp = false;
//   String verificationCode = "";
//   Future<void> sendOtp(
//       {required VoidCallback onVerified,
//       required BuildContext context,
//       required String phone}) async {
//     isWorkingOnOtp = true;
//     update();

//     // _getNumber();
//     Future.delayed(const Duration(milliseconds: 20));

//     try {
//       await FirebaseAuth.instance.verifyPhoneNumber(
//           phoneNumber: "+91$phone",
//           verificationCompleted: (PhoneAuthCredential credential) async {
//             final userCredential =
//                 await FirebaseAuth.instance.signInWithCredential(credential);
//             if (userCredential.user != null) {
//               onVerified();
//             } else {}
//           },
//           verificationFailed: (FirebaseAuthException e) {
//             debugPrint("OTP ISSUE $e");
//             isWorkingOnOtp = false;
//             update();
//             Fluttertoast.showToast(msg: "$e", backgroundColor: Colors.red);
//           },
//           codeSent: (String verificationId, int? resendToken) async {
//             verificationCode = verificationId;

//             isWorkingOnOtp = false;
//             Get.toNamed(RouteHelper.getVerificationRoute(
//                 "+91$phone", "", RouteHelper.signUp, ""));
//             update();

//             Fluttertoast.showToast(
//                 msg: "Otp has been sent to your phone number",
//                 backgroundColor: Colors.green);
//           },
//           codeAutoRetrievalTimeout: (String verificationID) {},
//           timeout: const Duration(seconds: 30));
//     } catch (e) {
//       Fluttertoast.showToast(msg: "$e");
//     }
//   }

//   Future<void> verifyOtp({
//     required String otp,
//     required BuildContext context,
//     required VoidCallback onVerified,
//   }) async {
//     isWorkingOnOtp = true;
//     update();

//     try {
//       await FirebaseAuth.instance
//           .signInWithCredential(PhoneAuthProvider.credential(
//               verificationId: verificationCode, smsCode: otp))
//           .then((value) async {
//         if (value.user != null) {
//           onVerified();
//         } else {
//           Fluttertoast.showToast(
//               msg: "Invalid OTP", backgroundColor: Colors.red);
//         }

//         isWorkingOnOtp = false;
//         update();
//       });
//     } on FirebaseAuthException catch (e) {
//       FocusScope.of(context).unfocus();
//       Fluttertoast.showToast(
//           msg: e.message ?? "Something is not working FirebaseAuthException ",
//           backgroundColor: Colors.red);
//       isWorkingOnOtp = false;
//       update();
//     } catch (e) {
//       isWorkingOnOtp = false;
//       Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
//       update();
//     }
//   }
// }
