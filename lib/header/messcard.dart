import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_easy/Screens/detials.dart';
import 'package:food_easy/Screens/profile.dart';
import 'package:food_easy/header/header.dart';


class MessCarddd extends StatelessWidget {
  MessCarddd(String s, String t, String u);

  String? get name => null;

  String? get rating => null;

  
  
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.all(20),
                child: InkWell(
                  onTap: (){ 
                    Navigator.push<void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>  DetailsScreen(),
                  ),
                  );
                  },
                  child: Card(
                    color: Colors.grey,
                    child: Container(
                      height: 120,
                      child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  'https://thumbs.dreamstime.com/b/cook-icon-vector-chef-avatar-man-flat-88903559.jpg',
                                  fit: BoxFit.fill,
                                  height: 100.0,
                                  width: 100.0,
                                ),
                              ),
                          ),
                          Column(crossAxisAlignment: CrossAxisAlignment.center
                          ,
                            children: [
                              Text(name!),
                              Text(rating!)
                            ],
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}