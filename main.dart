import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s the language used in flutter?',
      'answers': [
        {'text': 'Dart', 'score': 10},
        {'text': 'c', 'score': 0},
        {'text': 'c++', 'score': 0},
        {'text': 'java', 'score': 0},
      ],
    },
    {
      'questionText': 'externsion of a dart file',
      'answers': [
        {'text': '.d', 'score': 0},
        {'text': '.dat', 'score': 0},
        {'text': '.dart', 'score': 10},
        {'text': '.dt', 'score': 0},
      ],
    },
    {
      'questionText': 'flutter is mainly used for?',
      'answers': [
        {'text': 'ios app', 'score': 5},
        {'text': 'android', 'score': 5},
        {'text': 'both', 'score': 10},
        {'text': 'none', 'score': 0},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
