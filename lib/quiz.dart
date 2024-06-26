import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/home_page.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = "start-screen";

  void chooseAnswer(String answers) {
    selectedAnswers.add(answers);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = MyHomePage(switchScreen);

    if (activeScreen == "questions-screen") {
      screenWidget = QuestionsScreen(chooseAnswer: chooseAnswer);
    }

    if (activeScreen == "result-screen") {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: screenWidget,
    );
  }
}
