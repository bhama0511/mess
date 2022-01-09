import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_easy/Screens/detials.dart';
import 'package:food_easy/Screens/profile.dart';
import 'package:food_easy/header/header.dart';
import 'package:intl/intl.dart';






class Oldmeme extends StatefulWidget {
  //var Date = new DateTime.now();

  @override
  _OldmemeState createState() => _OldmemeState();
}

class _OldmemeState extends State<Oldmeme> {


String now = DateFormat("yyyy-MM-dd hh:mm").format(DateTime.now());
 // var Date = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('History'),),

      body: 
      ListView(
        children: [
          SizedBox(height: 10,),

          Container(
            height: 70,
            width:350, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.amber),
            child: Image.network('https://firebasestorage.googleapis.com/v0/b/food-easy-6f9b4.appspot.com/o/Anna%20mess.png?alt=media&token=cd4a2c15-ad2d-41bc-bb8d-28bce73b0d63'),
          ),

          SizedBox(height: 10,),
           Container(
            height: 70,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.amber),
            child: Image.network('https://firebasestorage.googleapis.com/v0/b/food-easy-6f9b4.appspot.com/o/tem2.png?alt=media&token=75f4057a-e9d2-4f73-9648-320bab70563f'),
          ),


          SizedBox(height: 10,),

           Container(padding: EdgeInsets.fromLTRB(15, 2, 30, 2),
            height: 70,
            width:100,
            decoration: BoxDecoration( image: DecorationImage(fit: BoxFit.fill,image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/food-easy-6f9b4.appspot.com/o/great.png?alt=media&token=18859b6d-c6b5-4d7b-b392-4ee3ba57f577")),borderRadius: BorderRadius.circular(15),color: Colors.amber),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column( mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$now', style: TextStyle(fontSize: 15,fontWeight:FontWeight.w500),),
                    Text("Anna mess" , style: TextStyle(fontSize: 25,fontWeight:FontWeight.w500),)
                  ],
                ),
                Text("LUNCH", style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),)
              ],
            )
          ),
          
        ],
      ),
    );
  }
}