
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_easy/Screens/profile.dart';

class Chec extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: 
    SafeArea(
      child: FloatingActionButton(child: Icon(Icons.home),
      onPressed: () {
    
        FirebaseFirestore.instance.collection('users/5GOacGkc3mYZUUwOTldHzAJ5Cg32/firstname')
        .snapshots().listen((data){
          print(data.docs[0]['email'] );
        }
        );
      },
      ),
    )
     
    );
  }
}