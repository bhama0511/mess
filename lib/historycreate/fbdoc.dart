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
    CollectionReference users = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('history');

    Future<void> addUser() {
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
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }

  

















   Widget boom(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Annapurna")),
    body: SafeArea(
      child: 
      Column(
        children: [
          
          Stack(
            children: [


              Card( color: Colors.amber,
              elevation: 0,
                child:  Container(
margin: EdgeInsets.only(bottom: 200),
                  //padding: EdgeInsets.only(bottom: 50),
                  height: 200,
                  width: 375,
                  child: Image.network("https://4.imimg.com/data4/EH/WV/MY-36572136/mess-services-500x500.jpeg",
                  fit: BoxFit.fill,),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 120,
                  right: 20,
//grey wala card
                 
                 
                  child: Card(
                     
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: Colors.grey,
                    child: Column( mainAxisAlignment: MainAxisAlignment.start ,

                   // Image.asset('https://4.imimg.com/data4/EH/WV/MY-36572136/mess-services-500x500.jpeg',fit: BoxFit.cover,),,
                      children: [

                        Container(height:110,padding: EdgeInsets.all(10),
                        child: Text('MENU', textAlign: TextAlign.center,style: TextStyle(fontSize: 40, color: Colors.white60 ), ),
                      ),
                       Text("Paneer Tikka", textAlign: TextAlign.center,style: TextStyle(fontSize: 30 ),),
                       Text("Tawa Roti" , textAlign: TextAlign.center,style: TextStyle(fontSize: 30 ),),
                       Text("Jeera Rice" , textAlign: TextAlign.center,style: TextStyle(fontSize: 30 ),),
                       Text("Daal Tadka",textAlign: TextAlign.center,style: TextStyle(fontSize: 30 ),),
                      ],
                    ),
                  ),
                ),
               

            ],
          ),
           //Container(height: 100, color: Colors.red,)
        TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  ),
  onPressed: ()// => addUser
 { Navigator.push(context, MaterialPageRoute(builder: (context)=>Mealbooked()));},
  child: Text('Confirm',textAlign: TextAlign.center,style: TextStyle(fontSize: 30 ),),
  
),  

     Text("NOTE- selected choice cannot be changed.",style:  TextStyle(fontSize: 10, color: Colors.red ))   
        ], 
      ) ,
      
      ),

     
      
    );
  }
}


