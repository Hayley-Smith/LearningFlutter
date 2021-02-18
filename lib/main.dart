import 'package:firstFlutterApp/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';

void main() => runApp(MyApp()); //runs the main class

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is you favorite color?',
      'answers': [
        {'text': 'red', 'score': 1},
        {'text': 'green', 'score': 2},
        {'text': 'yellow', 'score': 3},
      ],
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': [
        {'text': 'horse', 'score': 10},
        {'text': 'dog', 'score': 5},
        {'text': 'cat', 'score': 1},
      ],
    },
    {
      'questionText': 'What is your favorite dragon?',
      'answers': [
        {'text': 'red', 'score': 1},
        {'text': 'black', 'score': 2},
        {'text': 'gold', 'score': 3},
      ],
    }
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
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No more questions!');
    }
  }

  @override //makes it clear which build method should be used
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions) //quiz
            : Result(_totalScore, _resetQuiz), //center
      ),
    );
  } //build widget
} // State
