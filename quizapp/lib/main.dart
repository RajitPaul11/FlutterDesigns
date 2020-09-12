
import 'package:exploreapp/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget
{ 
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const[
    {
      'questionText': 'What\'s the fuel for combustion?',
      'answers': [
        {'text':'Oxygen','score': 10},
        {'text':'Nitrogen','score': 7},
        {'text':'Carbon','score': 3},
        ],
    },
    {
      'questionText': 'What\'s the most potent natural fertilizer?',
      'answers': [
        {'text':'Kelp','score': 10},
        {'text':'Cow Dung','score': 7},
        {'text':'Potassium','score': 3},
      ],
    },
  ];
correctans(int score)
{
  _totalScore += score;
  print("Correct");
  setState(() {
    if(_questionIndex < _questions.length )
    {
    _questionIndex = _questionIndex + 1;
    }  
  });
  print(_questionIndex);
}
mytap()
{ 
  setState(() {
  _questionIndex=0;
  _totalScore=0;
  });
}

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          leading: IconButton(
            icon: 
              Icon(Icons.autorenew), onPressed:mytap),
          title: Text("Quizzy"),
          ),
        body: _questionIndex < _questions.length ? 
        Quiz(
          questions:_questions,answerquestion: correctans,questionIndex: _questionIndex,
          )
        : Result(_totalScore)
      ),
      debugShowCheckedModeBanner: false,
      );
  }
}
