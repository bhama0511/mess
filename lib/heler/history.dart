import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserName1 extends StatelessWidget {

 
  @override
  Widget build(BuildContext context) {
    final userl =  FirebaseAuth.instance.currentUser ;
   final uid = userl!.uid;
    CollectionReference users = FirebaseFirestore.instance.collection('users').doc().collection('history');

    return Container(
      child: FutureBuilder<DocumentSnapshot>(
        future: users.doc().get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

         

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            return Text("${data['name']}");
          }

          return Text("loading");
        },
      ),
    );
  }
}

