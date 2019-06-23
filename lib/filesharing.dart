import 'dart:math';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/material.dart';
import 'Dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FileSharing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'RESOURCES',
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  )
                ],
              ),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Search',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    )
                  ],
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical : 0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Ordinary Diff. Equations',
                      style: TextStyle(fontFamily: 'RobotoSlab',fontWeight: FontWeight.bold),
                    ),

                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: <Widget>[
                        new Padding(
                      padding: new EdgeInsets.only(left: 0.0 , top:10),
                      child: new Icon(Icons.file_download),
                    ),
                    
                    Padding(
                        padding: new EdgeInsets.only(right:0,top:10),
                        child: GestureDetector(
                          onTap: () async {
                            final taskId = await FlutterDownloader.enqueue(
                            url: 'https://firebasestorage.googleapis.com/v0/b/stunet-8f7b3.appspot.com/o/ODE.pdf?alt=media&token=1854ed08-e88e-48e5-86aa-7ab1de176364',
                            savedDir: 'downloads/',
                            showNotification: true, // show download progress in status bar (for Android)
                            openFileFromNotification: true, // click on notification to open downloaded file (for Android)
                            
                            );

                          },
                          child: new Text('Download',style: new TextStyle(fontSize: 18.0),),
                        ),
                      ),
                     ],
                   ),
                  ],
                ),
              ),
             

            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: (){
          ChooseFile();
        },
      ),
      bottomNavigationBar:  BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                backgroundColor: Colors.tealAccent,
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

   File file;
   String filePath;
  String extension = 'pdf';

  Future<String> ChooseFile() async{
       final String fileName = Random().nextInt(10000).toString() +'.$extension';
    final StorageReference storageRef =
    FirebaseStorage.instance.ref().child(fileName);
    
    file = await FilePicker.getFile(fileExtension: '.$extension');
    StorageUploadTask uploadTask = storageRef.putFile(file);
    var downloadLink = (await uploadTask.onComplete).ref.getDownloadURL();
    var dUrl = downloadLink.toString();
    return dUrl;


    
  }


 

  
}