import 'package:flutter/material.dart';
import 'data/repositories/quiz_mock_repository.dart';
import 'models/question.dart';
import 'ui/screens/start_screen.dart';
import 'ui/screens/question_screen.dart';
import 'ui/screens/result_screen.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int screenIndex = 0;
  late List<Question> questions;
  Map<String, String> answers = {};
  int currentQuestion = 0;

  @override
  void initState() {
    super.initState();
    questions = QuizMockRepository.getQuestions();
  }

  void startQuiz() {
    setState(() {
      screenIndex = 1;
      answers = {};
      currentQuestion = 0;
    });
  }

  void answerQuestion(String answer) {
    setState(() {
      answers[questions[currentQuestion].id] = answer;
      if (currentQuestion < questions.length - 1) {
        currentQuestion++;
      } else {
        screenIndex = 2;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      screenIndex = 0;
      answers = {};
      currentQuestion = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen;
    if (screenIndex == 0) {
      screen = StartScreen(onStart: startQuiz);
    } else if (screenIndex == 1) {
      screen = QuestionScreen(
        question: questions[currentQuestion],
        questionIndex: currentQuestion,
        totalQuestions: questions.length,
        onAnswerSelected: answerQuestion,
      );
    } else {
      screen = ResultScreen(
        questions: questions,
        answers: answers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: screen,
      ),
    );
  }
}
