import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stunet/filesharing.dart';
import 'agora.dart';
 


    class Home extends StatelessWidget{      
      int cIndex = 0;
      String data , tag;
    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(

            children: <Widget>[

              Container(
                height: 150,
                child: ListView(
                  children: <Widget>[
                    
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DisplayArticle(data , tag)),
                      );
                        },

                        child: Card(
                            child: StreamBuilder(
                       stream: Firestore.instance.collection('article').snapshots(),
                       builder: (context, snapshot){
                         if(!snapshot.hasData)
                            return Text('Loading data.. Please Wait..'); 
                         else
                            return Column(
                          
                            children: <Widget>[
                            
                                  new Text( tag = snapshot.data.documents[0]['tag'].toString(),
                                    style: TextStyle(
                                      fontFamily: 'RobotoSlab',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24
                                    ),
                                  ),
                                  new Text(data =snapshot.data.documents[0]['data'].toString(), maxLines: 2,),
                                  new Padding(
                                    padding: new EdgeInsets.all(7.0),
                                    child: new Row(
                                      children: <Widget>[
                                      new Padding(
                                        padding: new EdgeInsets.only(left: 7 , top: 50),
                                        child: new Icon(Icons.thumb_up),
                                      ),
                                      new Padding(
                                        padding: new EdgeInsets.only(left:7.0,top:50),
                                        child: new Text('Like',style: new TextStyle(fontSize: 18.0),),
                                      ),
                                      new Padding(
                                        padding: new EdgeInsets.only(left: 150.0 , top:50),
                                        child: new Icon(Icons.people),
                                      ),
                                      new Padding(
                                        padding: new EdgeInsets.only(left:7.0,top: 50),
                                        child: new Text(snapshot.data.documents[0]['name'].toString(),style: new TextStyle(fontSize: 18.0),),
                                      ),
                                      SizedBox(height: 15.0 , width: 10),
                                            


                                    ],
                            )
                              )
                            ],
                          );  
                       },
                         
                  ),
                  ),
                      ),
                  ],
                        
                 
                

                ),
              ),     
            ],
          )
          ),
        
          floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: (){
          CallPage();
        },
      ),
          bottomNavigationBar:  BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.tealAccent,
                onTap: (cIndex){
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FileSharing()),
                      );
                },
                items: [
                
                  BottomNavigationBarItem(
                    icon: Icon(Icons.folder_special  ,color: Color.fromARGB(255, 0, 0, 0)),
                    title: new Text('Resources')
                    
                  ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.insert_comment,color: Color.fromARGB(255, 0, 0, 0)),
                  title: new Text('Forum')
              ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.remove_red_eye, color : Color.fromARGB(255, 0, 0, 0)),
                  title: new Text('Live Tutorials')
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.rss_feed, color : Color.fromARGB(255, 0, 0, 0)),
                  title: Text(
                    'Live Tutorials',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.feedback, color : Color.fromARGB(255, 0, 0, 0)),
                  title: Text(
                    'Live Tutorials',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
              ),

              ],
              
      ),
     );
    }
  }

class DisplayArticle  extends StatelessWidget{

  String data , tag;
  DisplayArticle(String Ardata , String Artag){
    data = Ardata;
    tag = Artag;
  }

  @override
  Widget build(BuildContext context){
    return(Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              tag,
              style: TextStyle(fontWeight: FontWeight.bold),
              ),

            Text(
              data,
            ),
          ],
        ),
      ),
    ));
  }

}