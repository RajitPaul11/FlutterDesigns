import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerquestion;

  Quiz({@required this.questions,
  @required this.answerquestion,
  @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            children: [
              Question(
                questions[questionIndex]['questionText'],
                ),
              ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer){
                return Answer(() => answerquestion(answer['score']), answer['text']);
              }).toList()
            ],
          ),
        );
  }
}