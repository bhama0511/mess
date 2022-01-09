import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_easy/Screens/mealbooked.dart';

class AddUser extends StatelessWidget {
  final String name;
  final String type;
  final String time;

  AddUser(this.name, this.type, this.time);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> decCount() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'name': name, // John Doe
            'type': type, // Stokes and Sons
            'time': time // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return 
    //boom(context);
    TextButton(
      onPressed: decCount,
      child: Text(
        "Add User",
      ),
    );

  }
 

}


