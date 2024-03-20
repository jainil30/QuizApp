import 'package:flutter/material.dart';
import 'package:quiz/home_page.dart';
import 'package:quiz/questions_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }

}

class _QuizState extends State<Quiz>{
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = MyHomePage(switchScreen);
    super.initState();
  }
  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: activeScreen,
    );
  }

}