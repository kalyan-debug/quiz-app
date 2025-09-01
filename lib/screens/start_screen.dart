import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.startQuiz, {
    super.key,
    this.lastScores,
    this.totalQuestions,
  });

  final void Function(String quizType) startQuiz;
  final Map<String, int>? lastScores;
  final Map<String, int>? totalQuestions;

  @override
  Widget build(BuildContext context) {
    // Get the specific scores for both quizzes from the maps
    final flutterScore = lastScores?['flutter'];
    final flutterTotal = totalQuestions?['flutter'];
    final javaScore = lastScores?['java'];
    final javaTotal = totalQuestions?['java'];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png', width: 300),
          const SizedBox(height: 40),
          const Text(
            'Choose your topic!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 30),

          // --- Flutter Quiz Button and Score ---
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              startQuiz('flutter');
            },
            label: const Text('Start Flutter Quiz'),
          ),
          const SizedBox(height: 5),
          if (flutterScore != null && flutterTotal != null)
            Text(
              'flutter Score: $flutterScore / $flutterTotal',
              style: const TextStyle(
                color: Color.fromARGB(255, 214, 187, 255),
              ),
            ),
          
          const SizedBox(height: 20),

          // --- Java Quiz Button and Score ---
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt),
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              startQuiz('java');
            },
            label: const Text('Start Java Quiz'),
          ),
          const SizedBox(height: 5),

          // Add this part to display the Java score
          if (javaScore != null && javaTotal != null)
            Text(
              'java Score: $javaScore / $javaTotal',
              style: const TextStyle(
                color: Color.fromARGB(255, 214, 187, 255),
              ),
            ),
        ],
      ),
    );
  }
}