import 'package:my_quiz/models/quiz_question.dart';

const flutterQuestions = [
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets', // Correct Answer
      'Blocks',
      'Components',
      'Functions', // Comma is now added
    ],
  ),
  QuizQuestion(
    'How are Flutter UIs built?',
    [
      'By combining widgets in code', // Correct Answer
      'By using XCode for iOS and Android Studio for Android',
      'By combining widgets in a visual editor',
      'By defining widgets in config files',
    ],
  ),
  QuizQuestion(
    'What\'s the purpose of a StatefulWidget?',
    [
      'Update UI as data changes', // Correct Answer
      'Render UI that does not depend on data',
      'Update data as UI changes',
      'Ignore data changes',
    ],
  ),
  QuizQuestion(
    'Which widget should you try to use more often: StatelessWidget or StatefulWidget?',
    [
      'StatelessWidget', // Correct Answer
      'None of the above',
      'StatefulWidget',
      'Both are equally good',
    ],
  ),
  QuizQuestion(
    'What happens if you change data in a StatelessWidget?',
    [
      'The UI is not updated', // Correct Answer
      'Any nested StatefulWidgets are updated',
      'The UI is updated',
      'The closest StatefulWidget is updated',
    ],
  ),
  QuizQuestion(
    'How should you update data inside of StatefulWidgets?',
    [
      'By calling setState()', // Correct Answer
      'By calling updateState()',
      'By calling updateData()',
      'By calling updateUI()',
    ],
  ),
];