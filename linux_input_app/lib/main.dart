import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main()=>runApp(MyMaterialApp());
var x;
class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScaffoldApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyScaffoldApp extends StatelessWidget {
   web(cmd) async{
  var url= 'http://192.168.43.236/cgi-bin/web.py?x=${cmd}';
  var response = await http.get(url);
  print(response.body);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LinuxInputApp'),
        leading: Icon(Icons.change_history),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, 
                width: 2,
                ),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Command',
                hintStyle: TextStyle(
                  color: Colors.black45,
                  ),
                contentPadding: EdgeInsets.all(2),
              ),
              onChanged: (val){
                x=val;
              },
            )
          ),
          Container(
            child: FlatButton(onPressed: (){web(x);}, child: Text('Submit'),color: Colors.amber,),
          ),
        ],
      ),
    );
  }
}