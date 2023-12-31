import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child:const Text("welcome My Profile Page",style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold,color: Colors.amber),),)),
    );
  }
}