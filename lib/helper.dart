import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
 

  

  @override
  Widget build(BuildContext context) {
    String name = '';
    final user =  FirebaseAuth.instance.currentUser ;
   final uid = user!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return Column(
      children: [
        FutureBuilder<DocumentSnapshot>(
          future: users.doc(uid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
             
              return Container(
                padding: EdgeInsets.fromLTRB(10, 20, 5, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    ////mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['firstname'] , style: TextStyle(fontSize: 25),),
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
                      Positioned(top:35,right:37,child: Center(child: Text('${data['meals']}'),))
                    ],
                  ),
                  
                ],
              ),
            
              );

            }
            return Container();

            
            
          },
        ),

        
      ],
    );
  }
}