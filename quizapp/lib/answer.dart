
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandler;
  Answer(this.selectHandler,this.answerText);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
       child: RaisedButton(
            color: Colors.blue,
            child: Text(
              answerText, 
              style: TextStyle(color: Colors.white, fontSize: 15),
              ), 
            onPressed: this.selectHandler),
    );
  }
}