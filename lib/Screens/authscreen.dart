import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:food_easy/Screens/authform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthScreen extends StatefulWidget {
  

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm( 
    String firstname,
    String middlename,
    String surname,
    String sis,
    String mob,
    String email,
    String password,
    bool  isLogin,
    BuildContext ctx,
  ) 

  async
  { 
      var authResult= null;
      //AuthResult authResult;
  try{
    _isLoading =true;

if (isLogin){

      authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);

    } else{

         authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance.collection('users').doc(authResult.user.uid).set({
        'firstname':firstname,
        'middlename':middlename,
        'surname': surname,
        'sis': sis,
        'mob': mob,
        'email' : email,
        'password':password,
        
       
      });
    }

    
  } on PlatformException catch (err) {

    var message = 'An error occured,please check your credentials!';

    if (err.message != null) {
      message = err.message!;
      
    }
           // yeh kam nahi karra

       //  Scaffold.of(ctx).showSnackBar(Snackbar(content: Text(message),
       //  backgroundColor: Theme.of(ctx).errorColor),);


       setState(() {
         _isLoading=false;
       });
    
  }
 
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Authform( 
        _submitAuthForm,
        _isLoading),
    );
  }
}

