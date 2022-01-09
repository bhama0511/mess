import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_easy/Screens/authscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_easy/Screens/history.dart';
import 'package:food_easy/Screens/mealbooked.dart';
import 'package:food_easy/header/databasemanager.dart';
import 'package:food_easy/header/text.dart';
import 'package:food_easy/heler/history.dart';
import 'package:food_easy/heler/youtube.dart';
import 'package:food_easy/helper.dart';
import 'package:food_easy/historycreate/fbdoc.dart';

class Profile extends StatelessWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),
      actions: [
        DropdownButton(icon: Icon(Icons.more_vert),
        items: [
          DropdownMenuItem(child: Container(child: Row(
            children: <Widget>[
              Icon(Icons.exit_to_app),
              SizedBox(width: 8),
              Text('logout'),
            ],
          ),
          ),
          value: 'logout',
          ),
        ],
        
        onChanged: (itemIdentifier) {
          if (itemIdentifier == "logout")
          {
            FirebaseAuth.instance.signOut();
          
          }
          
        },
        

        ),
      ],
      ),



      body: 
      Column(
        children: [
           Header(),
                  //uper ka wo pahlach hai 
                  //uper ka wo pahlach hai 
                   //uper ka wo pahlach hai 
                  //uper ka wo pahlach hai 

          Container(
             padding: EdgeInsets.all(15),
             child: Text("Top up your wallet", style:TextStyle(fontSize: 30,background: Paint(), color: Colors.amber) )),
       
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:[
                SizedBox(width: 30,),
                Container(width: 300,height: 200,
                child: Image.asset("images/1.png"),),

                SizedBox(width: 30,),

                 Container(width: 300,height: 200,
                child: Image.asset("images/2.png"),),

                SizedBox(width: 30,),

                 Container(width: 300,height: 200,
                child: Image.asset("images/3.png"),),
                SizedBox(width: 30,),
              ]

            ),
          ),


      SizedBox(height: 10,),

 
         
         // Container(child: SpringButton(SpringButtonType.OnlyScale,Text("hello")) ,)
         SizedBox(height: 70),
         Container(height: 50,width:370,child: ElevatedButton(onPressed: () {Navigator.push<void>(context,MaterialPageRoute<void>(
                 builder: (BuildContext context) => Oldmeme(),
               ),
               );}, child: Text("History"))),
         SizedBox(height: 5),
         Container(height: 50,width: 370,child: ElevatedButton(
           
           onPressed: () {Navigator.push<void>(context,MaterialPageRoute<void>(
                 builder: (BuildContext context) => Check()
               ),
               );},
           
           child: Text("Customer Support"))),
         SizedBox(height: 5),
         Container(height: 50,width: 370,child: ElevatedButton(
           onPressed: () {Navigator.push<void>(context,MaterialPageRoute<void>(
                 builder: (BuildContext context) => AddUser('anna', 'lunch', '20/11/2021')
                 //UserInformation()
                 // GetUserName1(),
               ),
               );},
           child: Text("Logout"))),
        ],
      ),
      
      
    );
  }
}























// class _MYhomepage extends StatefulWidget {
//   const _MYhomepage({ Key? key }) : super(key: key);

//   @override
//   __MYhomepageState createState() => __MYhomepageState();
// }

// class __MYhomepageState extends State<_MYhomepage> {

//   PageController pagecontroller=PageController();
//   List<Widget>pages=[HomePage(), Text("hello"),Text("hello")];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//     ); 
//   }
// }