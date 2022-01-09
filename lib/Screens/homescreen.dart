
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_easy/Screens/detials.dart';
import 'package:food_easy/Screens/history.dart';
import 'package:food_easy/Screens/profile.dart';
import 'package:food_easy/header/databasemanager.dart';
import 'package:food_easy/header/header.dart';
import 'package:food_easy/header/messcard.dart';
import 'package:food_easy/helper.dart';






class HomePage extends StatefulWidget {



  @override
  _HomePageState createState() => _HomePageState();

  
}

class _HomePageState extends State<HomePage> {

int _selectedIndex =0;
List <Widget> _widgetoptions =<Widget>[
  Profile(),
  Profile(),
  Profile(),
];


void _onItemTap (int index){
  setState ((){
    _selectedIndex=index;
  });


//arya
  // final user =  FirebaseAuth.instance.currentUser ;
  // final uid = user!.uid;
//final UserName=  FirebaseFirestore.instance.collection('users').doc(uid).get();
}



//yeh wala counter ke liye hai 
  kamkarbe()
  async{

     CollectionReference users = FirebaseFirestore.instance.collection('users');
    // QuerySnapshot querySnapshot = await CollectionReference.doc();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: 
       SafeArea(
        child: 
        
        SingleChildScrollView(
          child: Container(
            
            child: Column(
              children: [
               // _widgetoptions [_selectedIndex],
        Header(),
                //UserInformation1(),
                
              Text("chose your mess!",style: TextStyle(fontSize: 25), textAlign: TextAlign.left,),   
              
        //yaha se menu chalu hota
              
             
        
        
             Card( color: Colors.amberAccent,
             
                     child: Column(
                     children: [
                                Container(
                                  padding: EdgeInsets.all(1),
                                  child: 
                                  InkWell(onTap: (){Navigator.push<void>(context,MaterialPageRoute<void>(
                     builder: (BuildContext context) =>  DetailsScreen(),
                                    ),
                                    );
                                    },
                                    child: messCard(context, "anjjjjja","ratings 6/4")
                                  ),
                                 ),
                         
                                 Container(
                                  padding: EdgeInsets.all(1),
                                  color: Colors.blue,
                                  child: 
                                  InkWell(onTap: (){Navigator.push<void>(context,MaterialPageRoute<void>(
                     builder: (BuildContext context) => Oldmeme(),
                                    ),
                                    );
                                    },
                                    child: messCard(context, "Anna","ratings 6/4")
                                  ),
                                 ),

                                 Container(
                                  padding: EdgeInsets.all(1),
                                  color: Colors.orange,
                                  child: 
                                  InkWell(onTap: (){Navigator.push<void>(context,MaterialPageRoute<void>(
                                  builder: (BuildContext context) => Oldmeme(),
                                    ),
                                    );
                                    },
                                    child: messCard(context, "Anna","ratings 6/4")
                                  ),
                                 ),

                             //  Container(child: messCard(context, "anjjjjja","ratings 6/4")),
                               //Container(child: messCard(context, "anjjjjja","ratings 6/4")),
                              // MessCarddd(context, "anjjjjja","ratings 6/4")
                              ],
                                ),
             ),
        
            
        
              
        
              ],
            ),
          ),
        ),
      ),






      //NAV BAR YAHA SE CHALU HUA
      
      bottomNavigationBar: BottomNavigationBar(

        items: const 
        <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add),
            label: 'notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],  
        //type:BottomNavigationBarType.shifting,

        currentIndex:_selectedIndex,
        onTap: _onItemTap   


      ),

    );


  }

  
  }


   
    Widget messCard (context, String name,String rating)
    {
    return Container(
                padding: EdgeInsets.all(5),
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
                            Text(name),
                            Text(rating)
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
    );
  }