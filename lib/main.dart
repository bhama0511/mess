import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_easy/Screens/authform.dart';
import 'package:food_easy/Screens/authscreen.dart';
import 'package:food_easy/Screens/homescreen.dart';

void main() 
  async{
     WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
 
  runApp(MyApp()
  );
}

class MyApp extends StatelessWidget
 {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.blue,
      ),

      home: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, userSnapshot) 
      
      {
        if (userSnapshot.hasData) {
          return HomePage();
        }
        return AuthScreen();
      },
    )

    );
  }

}


