import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  var totalscore;
  Result(this.totalscore);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bravo! Quiz Completed", 
                style: TextStyle(
                  fontStyle: FontStyle.italic, 
                  fontSize: 33),
                  ),
                Text("Total Score Is :",
                style: TextStyle(fontSize: 26 ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Text('$totalscore', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 39
                    ),
                    ),
                )
              ],),
    );
  }
}