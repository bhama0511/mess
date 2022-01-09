import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Authform extends StatefulWidget {
  
  Authform( this.submtFn,
  this.isLoading,);
  final bool isLoading;
  final void Function(
    String firstname,
    String middlename,
    String surname,
    String sis,
    String mob,
    String email,
    String password,
    bool  isLogin,
    BuildContext ctx,
  ) submtFn;
   

  @override
  _AuthformState createState() => _AuthformState();
}

class _AuthformState extends State<Authform> {
  var keyboardType;
  final _formey = GlobalKey<FormState>();

  var _islogin = true;

  String _firstname = '';
  String _middlename = '';
  String _surname = '';
  String _sis = '';
  String _mob = '';
  String _useremail = '';
  String _password = '';

  void _trySubmit() {

    final isValid = _formey.currentState!.validate();

    //to remove eyboard from screen
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formey.currentState!.save();

     widget.submtFn(
       _firstname.trim(),
       _middlename.trim(),
       _surname.trim(),
       _sis.trim(),
       _mob.trim(),
       _useremail.trim(),
       _password.trim(),
       _islogin,
       context
     );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(child: Card(
        color: Colors.white70,
        margin: EdgeInsets.all(20), 

      child:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16), child: 
          
          Form(
            key: _formey,
            
            child: Column( 
            mainAxisSize: MainAxisSize.min,
            children: <Widget> [

              if(!_islogin)
              TextFormField(
                  // to asn a unique id to text field
                key: ValueKey('firstname'),
                  keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration( 
              icon: Icon(Icons.person,color: Colors.indigo),
              hintText: 'firstname',
              labelText: 'First Name',
              ),
              onSaved: (value){
                _firstname =value!;
              },
              ),
              if(!_islogin)
              TextFormField(
                  // to asn a unique id to text field
                key: ValueKey('middlename'),
                  keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration( 
              icon: Icon(Icons.person ,color: Colors.indigo),
              hintText: 'middle name',
              labelText: 'Middle name',
              ),
              onSaved: (value){
                _middlename =value!;
              },
              ),
              if(!_islogin)
              TextFormField(
                  // to asn a unique id to text field
                key: ValueKey('surname'),
                  keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration( 
              icon: Icon(Icons.person,color: Colors.indigo),
              hintText: 'surname',
              labelText: 'Surname',
              ),
              onSaved: (value){
                _surname =value!;
              },
              ),

              if(!_islogin)
               TextFormField(
                 // to asn a unique id to text field
                key: ValueKey('sis'),
                 
              decoration: const InputDecoration( 
              icon: Icon(Icons.cabin,color: Colors.green),
              hintText: '306140',
              labelText: 'SIS ID',
              ),
              onSaved: (value){
                _sis =value!;
              },
              ),

              if(!_islogin)
               TextFormField(
                 // to asn a unique id to text field
                key: ValueKey('mob'),
                 
              decoration: const InputDecoration( 
              icon: Icon(Icons.mobile_friendly,color: Colors.orange),
              hintText: '7058788128',
              labelText: 'Mobile NO.',
              ),
              onSaved: (value){
                _sis =value!;
              },
              ),




//email

              TextFormField( 
                // to asn a unique id to text field
                key: ValueKey('email'),
                
                validator: (value) {
                if (value!.isEmpty || !value.contains('@'))  {
                  return'Enter Email Adress';
                }
                return null; 
              },
                keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration( 
              icon: Icon(Icons.mail,color: Colors.amber,),
              hintText: 'example@gmail.com',
              labelText: 'Email Adress',
              ),
              onSaved: (value){
                _useremail =value!;
              },
              ),
              //yeh sign up wle mai hona bs apun ko
        
               TextFormField(
                  // to asn a unique id to text field
                key: ValueKey('password'),
                  keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration( 
              icon: Icon(Icons.password,color: Colors.red),
              hintText: '........',
              labelText: 'password',
              ),
              onSaved: (value){
                _password =value!;
              },
              ),

              SizedBox(height:20),

            if(widget.isLoading)
              CircularProgressIndicator(),

            if(!widget.isLoading)  
              RaisedButton(child: Text( _islogin ? 'log in' :'Register'), onPressed: _trySubmit ),

            if(!widget.isLoading) 
              FlatButton(child: Text( _islogin ? 'create new account' :'I already have an account'),  onPressed: () {
                  setState(() {
                    _islogin=!_islogin;
                  });
                
              },),
              
            ],
          ), ),
          ),
          )
           ,)
           ,)
    );
  }
}