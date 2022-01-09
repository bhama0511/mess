import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_easy/heler/youtube2.dart';

class Check extends StatefulWidget {
 

  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<Check> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("history"),),

      body: body(),
    );
  }

  Widget body() 
  {
    var stream =FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('history').snapshots(); 
    //.get().asStream(); isme real time changes nahi aate
    return StreamBuilder(
      stream: stream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) 
      // return kya karna hai
      {
        // checking interaction
        switch (snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Text("failed");
          default:
          if (snapshot.hasData){

            // yeh hai baki galat ka hai
           if ( snapshot.data!.docs.length ==0)
           {
             return Text('no record found');
           }
           // yaha se to be more specific
          else{
            return
            ListView.builder(
              scrollDirection: Axis.vertical,
            //  controller: ,
            //  physics: ,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index)
            { String id =snapshot.data!.docs[index].id;
              String name =snapshot.data!.docs[index]['name'];
              String type =snapshot.data!.docs[index]['type'];

              return GestureDetector(
                onTap: (){},
                child: Container(padding: EdgeInsets.fromLTRB(15, 2, 30, 2),margin: const EdgeInsets.only(top
                : 10.0),
            height: 70,
            width:100,
            decoration: BoxDecoration( image: DecorationImage(fit: BoxFit.fill,image: NetworkImage("https://firebasestorage.googleapis.com/v0/b/food-easy-6f9b4.appspot.com/o/great.png?alt=media&token=18859b6d-c6b5-4d7b-b392-4ee3ba57f577")),borderRadius: BorderRadius.circular(15),color: Colors.amber),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column( mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ryj', style: TextStyle(fontSize: 15,fontWeight:FontWeight.w500),),
                    Text('$name', style: TextStyle(fontSize: 25,fontWeight:FontWeight.w500),)
                  ],
                ),
                Text('$type', style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
                
              ],
              
            ),
            
          ),
                );
            });
          }
          }
          else
           {return Text("getting data");
            
          }
        }
      },
      );
  }
}