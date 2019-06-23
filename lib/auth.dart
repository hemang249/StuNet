import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';



class SplashScreen extends StatelessWidget {

  bool isAdvertiser;

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column (
          
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 50 , horizontal: 0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'StuNet',
                      style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),

              ),
              SizedBox(height: 100,width: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Container(
                    width: 300,
                    height: 40,
                    child: RaisedButton(
                      splashColor: Colors.transparent,
                      child: Text(
                        'I\'m An Advertiser',
                        style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'RobotoSlab',
                      
                        
                      ),
                    ),
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20) ),
                    
                    
                    onPressed: (){
                      isAdvertiser = true;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },  
                  ),
                  ),
                ],
              ),
              SizedBox(height: 40,width: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  Container(
                    width: 300,
                    height: 40,
                    child: RaisedButton(
                      splashColor: Colors.transparent,
                      child: Text(
                        'I\'m A Student',
                        style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'RobotoSlab',
                      
                        
                      ),
                    ),
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20) ),
                    
                    
                    onPressed: (){
                      isAdvertiser = false;
                    },  // Choose whether it is a student
                  ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }

  
}

  class Register extends StatelessWidget{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    String email , passwd;
    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'RobotoSlab',
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                

              ],
            ),
            SizedBox(width: 10, height: 50),

              Container(
              
              margin: EdgeInsets.only(left:20 , right: 20),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'Enter Email',
                  hintStyle: TextStyle(
                    fontFamily: 'RobotoSlab',
                    color: Colors.white,
                                     
                  ),
                  
                ),
                onChanged: (value){
                  email = value;  
                },
              ),

              

            ),
            SizedBox(width: 10,height: 30),

            Container(
              
              margin: EdgeInsets.only(left:20 , right: 20),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: const BorderRadius.all(const Radius.circular(20)),
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(
                    fontFamily: 'RobotoSlab',
                    color: Colors.white,
                    
                    
                  ),
                  
                ),
                obscureText: true,
                onChanged: (value){
                  passwd = value;
                },
              ),

              

            ),

          SizedBox(width: 10,height: 50),

          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20 , right: 20),
                  child:  new RaisedButton(
                    elevation: 4,
                    color: Colors.green,
                    onPressed: (){
                      SignUp();
                      
                      //_auth.createUserWithEmailAndPassword(email: email , password: passwd);
                      //_auth.signInWithEmailAndPassword(email: email,password: passwd);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserInfo()),
                      );
                      
                    },
                

                 
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  
                  ),
                ),
              ],
            ),

          ],),
        ),
      );
    }

    void SignUp() async {
      
      FirebaseUser user;
      try{
      user = await _auth.createUserWithEmailAndPassword(email: 'patelayush@gmail.com' , password: 'ayush@123');
      if(user!=null){
          user = await _auth.signInWithEmailAndPassword(email: 'patelayush@gmail.com' , password: 'ayush@123');
        }
      }catch(e){
        print(e);
      }
    }
  }

  class UserInfo extends StatelessWidget {
    
    String name , institution , age , branch;

    
    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0 , vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Set Up Your Profile',
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 50, height: 65),

              Container(
               margin: EdgeInsets.only(left: 20 , right: 20),
               child: TextField(
               
               decoration: InputDecoration(
                 enabledBorder: new OutlineInputBorder(
                   borderRadius: const BorderRadius.all(const Radius.circular(20)),
                   borderSide: BorderSide(
                     color: Colors.white,
                   ),
                 ),
                 hintText: 'Enter Name',
                 hintStyle: TextStyle(
                   fontFamily: 'RobotoSlab',
                   color: Colors.white,
                 ),
                 
               ),
              onChanged: (value){
                
              },
             ),
             ),
            
            
            SizedBox(width: 10,height: 20),

            Container(
               margin: EdgeInsets.only(left: 20 , right: 20),
               child: TextField(
               
               decoration: InputDecoration(
                 enabledBorder: new OutlineInputBorder(
                   borderRadius: const BorderRadius.all(const Radius.circular(20)),
                   borderSide: BorderSide(
                     color: Colors.white,
                   ),
                 ),
                 hintText: 'Enter Institution',
                 hintStyle: TextStyle(
                   fontFamily: 'RobotoSlab',
                   color: Colors.white,
                 ),
                 
               ),
              onChanged: (value){
                
              },
             ),
             ),

             SizedBox(width: 10,height: 20),
             Container(
               margin: EdgeInsets.only(left: 20 , right: 20),
               child: TextField(
               
               decoration: InputDecoration(
                 enabledBorder: new OutlineInputBorder(
                   borderRadius: const BorderRadius.all(const Radius.circular(20)),
                   borderSide: BorderSide(
                     color: Colors.white,
                   ),
                 ),
                 hintText: 'Enter Field Of Interest',
                 hintStyle: TextStyle(
                   fontFamily: 'RobotoSlab',
                   color: Colors.white,
                 ),
                 
               ),
              onChanged: (value){
                
              },
             ),
             ),
            
              SizedBox(width: 10, height: 30),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 0),
                child: RaisedButton(
                  color: Colors.deepOrange,
                  child: Text(
                    'Proceed',
                    style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                    ),
                  ),

                  onPressed: () {
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                  },
                ),
              ),
            ],
          ), 
          ),
      );
    }
  }