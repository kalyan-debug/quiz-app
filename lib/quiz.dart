import 'package:flutter/material.dart';
import 'package:my_quiz/data/flutter_questions.dart';
import 'package:my_quiz/data/java_questions.dart';
import 'package:my_quiz/models/quiz_question.dart';
import 'package:my_quiz/screens/questions_screen.dart';
import 'package:my_quiz/screens/results_screen.dart';
import 'package:my_quiz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';
  List<QuizQuestion> _activeQuestions = [];
  
  // A variable to track which quiz is currently being played
  String _currentQuizType = '';

  // Use Maps to store scores for each quiz type
  final Map<String, int> _lastScores = {};
  final Map<String, int> _totalQuestionsInQuiz = {};

  void _switchScreen(String quizType) {
    setState(() {
      // Set the current quiz type when starting
      _currentQuizType = quizType;
      if (quizType == 'flutter') {
        _activeQuestions = flutterQuestions;
      } else {
        _activeQuestions = javaQuestions;
      }
      _activeScreen = 'questions-screen';
    });
  }

  void _chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == _activeQuestions.length) {
      int correctAnswers = 0;
      for (var i = 0; i < _activeQuestions.length; i++) {
        if (_selectedAnswers[i] == _activeQuestions[i].answers[0]) {
          correctAnswers++;
        }
      }

      setState(() {
        // Use the quiz type as the key to save the score in the map
        _lastScores[_currentQuizType] = correctAnswers;
        _totalQuestionsInQuiz[_currentQuizType] = _activeQuestions.length;
        _activeScreen = 'results-screen';
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Pass the entire maps down to the StartScreen
    Widget screenWidget = StartScreen(
      _switchScreen,
      lastScores: _lastScores,
      totalQuestions: _totalQuestionsInQuiz,
    );

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: _chooseAnswer,
        questions: _activeQuestions,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: _restartQuiz,
        questions: _activeQuestions,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 122, 70, 212),
                Color.fromARGB(255, 71, 38, 128),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}