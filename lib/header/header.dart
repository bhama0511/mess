import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Headerbe extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    ////mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello Arya," , style: TextStyle(fontSize: 25),),
                      Text("Welcome Back!" , style: TextStyle(fontSize: 30),)
                    ],
                  ),
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          height: 90,
                          width: 90,
                          child: CircularProgressIndicator(
                          strokeWidth: 5,
                          value: 1.0,
                        ),),
                      ),
                      Positioned(top:35,right:37,child: Center(child: Align(alignment: Alignment.center,child: Text("58", )),))
                    ],
                  ),
                  
                ],
              ),
            
              );
  }
}