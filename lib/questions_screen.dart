
import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/modals/quiz_questions.dart';
import 'package:quiz/quiz.dart';

class QuestionsScreen extends StatefulWidget{
  QuestionsScreen({required this.chooseAnswer,super.key});

  void Function(String answer) chooseAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen>{
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer){

    widget.chooseAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(

          gradient: LinearGradient(colors: [

            Color.fromRGBO(6, 90, 218, 1.0),
            Color.fromRGBO(84, 145, 234, 1.0),
            Color.fromRGBO(135, 159, 245, 1.0),])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(questions[0].question,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              ),
            ),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: AnswerButton(answerText: answer, onTap: (){
                    answerQuestion(answer);
                  })
              );
            })

          ],
        )
      ),
    );
  }

}