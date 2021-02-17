import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
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
    'answers': ['red', 'green', 'blue'],
  },
  {
    'questionText': 'What is your favorite animal?',
    'answers': ['horse', 'dog', 'cat'],
  },
  {
    'questionText': 'What is your favorite animal2?',
    'answers': ['horse2', 'dog2', 'cat2'],
  }
  ];
  var _questionIndex = 0;

  void _answerQuestion(){

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
        body: _questionIndex < _questions.length ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions) //quiz
            : Center(child: Text('You did it!'),), //center
      ),
    );
  } //build widget
} // State
