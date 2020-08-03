import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

myapp1()
{
  FlutterStatusbarcolor.setStatusBarColor(Colors.grey.shade800);
  myprint(){
    print('Rajit Paul');
  }
  mytoast()
  {
    Fluttertoast.showToast(
      msg: "This is Rajit",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.amber,
      textColor: Colors.white,
      fontSize: 16.0);
  }

  var mybody = Container(
    alignment: Alignment.center,
    width: double.infinity,
    height: double.infinity,
    margin: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.grey.shade400,
      border: Border.all(
        color: Colors.blue.shade300,
        width:3
      ),
    ),
    child:(Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.blue.shade900,
                width: 3,
              ),
            ),
          margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(30),
          //padding: EdgeInsets.only(left:70),
          alignment: Alignment.center,
          width: 350,
          height: 200,
          //color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Rajit Paul',
                style: TextStyle(color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.email),
                  Text('rajitpaull@gmail.com')
                ],
              ),    
            ],
          ),
        ),
      GestureDetector(
        onTap: myprint,
        //onDeoubleTap: myprint,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://raw.githubusercontent.com/BalancePlay/JenkinsJobChain/master/A.jpg'),
                fit: BoxFit.cover,
              ),
              color: Colors.amber,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.blue.shade900,
                width: 3,
                ),
            ),
          // margin: EdgeInsets.all(20),
          width: 100,
          height: 100,
          //color: Colors.blue,
          //child: Text('second'),
          ),
      ),
      ],
    )
    )
  );

return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Profiler'),
        backgroundColor: Colors.grey.shade600,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_a_photo), onPressed: mytoast),
          IconButton(icon: Icon(Icons.account_circle), onPressed: null)        
          ],
      ), 
      body: mybody,
      ),
    );
}