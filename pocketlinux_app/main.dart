import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    var fsconnect = FirebaseFirestore.instance;
    var cmd;
    var x;
    var webdata;
    var _controller = TextEditingController();
    TextEditingController ipController = new TextEditingController();
    web(cmd) async{
      var url= 'http://${ipController.text}/cgi-bin/web.py?x=${cmd}';
      var response = await http.get(url);
      setState(() {
        webdata = response.body;
      });
      fsconnect.collection("linuxcmdoutput").add({ '$cmd': '$webdata' });
      print(webdata);
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('Pocket Linux App',
        style: TextStyle(
          color: Colors.amber,
        ),),
        leading: Icon(
          FontAwesomeIcons.linux,
           color: Colors.amber,
           ),),
      body:     SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(height: 15),
                      TextField(
                         cursorColor: Colors.amber,
                         style: TextStyle(
                           color: Colors.limeAccent,
                         ),
                         controller: ipController,
                         decoration: InputDecoration(
                         enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                         borderSide: BorderSide(color: Colors.amber, width: 1),),
                         focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                         borderSide: BorderSide(color: Colors.amber),),  
                         hintText: 'Enter the IP of remote LinuxOS',
                         prefixIcon: Icon(FontAwesomeIcons.networkWired,
                         color: Colors.lime,),
                         hintStyle: TextStyle(
                           color: Colors.lime.shade500,
                           fontStyle: FontStyle.italic,
                         ),
                         labelText: 'Remote Linux IP',
                         labelStyle: TextStyle(
                           fontWeight: FontWeight.bold,
                           color: Colors.amber,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                        Container(
                          child: Image.asset('assets/linux.png'),
                          width: 500,
                          height: 250,
                        ),
                      Container(
                        margin: EdgeInsets.all(20),
                        color: Colors.black,
                        padding: EdgeInsets.all(10),
                        child: Text('Remote Linux Access',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),),),
                      Card(
                      child: TextField(
                         cursorColor: Colors.amber,
                         style: TextStyle(
                           color: Colors.limeAccent,
                         ),
                         controller: _controller,
                         decoration: InputDecoration(
                         enabledBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(12.0)),
                         borderSide: BorderSide(color: Colors.amber, width: 1),),
                         focusedBorder: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                         borderSide: BorderSide(color: Colors.amber),), 
                         prefixIcon: Icon(
                           FontAwesomeIcons.keyboard,
                           color: Colors.amber,
                          ), 
                         hintText: 'Enter your command',
                         hintStyle: TextStyle(
                           color: Colors.amberAccent,
                           fontStyle: FontStyle.italic,
                           fontWeight: FontWeight.bold,
                         ),
                       ), 
                        onChanged: (value){
                         cmd = value;
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    RaisedButton(
                      onPressed: (){
                        web(cmd);
                      },
                      color: Colors.amber,
                      child: Text('RUN',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          width: 2,
                        )
                      ),
                      child: FlatButton(
                        onPressed: _controller.clear, 
                        child: Text('Clear',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                        )),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          stops: [
                            0.1,
                            0.5,
                            0.3,
                          ],
                          colors: [
                            Colors.amberAccent,
                            Colors.black,     
                            Colors.amber,                     
                            ]),),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.grey,
                              child: Text(
                                webdata ?? "\n COMMAND OUTPUT \n",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black45,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    ],
                  ),
                  
                  ),),
              );
  }
}