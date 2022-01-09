import 'package:flutter/material.dart';
import 'package:food_easy/Screens/profile.dart';
import 'package:food_easy/heler/arya2.dart';
import 'package:food_easy/heler/history.dart';
class Mealbooked extends StatelessWidget {
  const Mealbooked({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          
          Column(
            children: [
      
              SizedBox(height: 70,),
              Container(
                child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS46fVAt0D8_F5uLNPRXWUZ89KW4DzIJOZecQ&usqp=CAU'),
                
              ),
           
            SizedBox(height: 70,),
            Container(
              child: Text('Your meal is booked' ,style: TextStyle(fontSize: 50), textAlign:TextAlign   .center,),
            ),
            SizedBox(height: 20,),
               Container(height: 50,width: 200,
               child: ElevatedButton(
                child: Text('History'),
                onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
        },
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                    textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),),),
            SizedBox(height: 20),
        
      
            ],
          ) ,),
      ),
    );
  }
}