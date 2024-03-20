import 'package:flutter/material.dart';
import 'package:quiz/answer_button.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});


  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [                Color.fromRGBO(6, 90, 218, 1.0),
            Color.fromRGBO(84, 145, 234, 1.0),
            Color.fromRGBO(135, 159, 245, 1.0),])
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Question will be here...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
            ),
            AnswerButton(answerText: "Answer 1", onTap: (){print("1");}),
            AnswerButton(answerText: "Answer 2", onTap: (){}),
            AnswerButton(answerText: "Answer 3", onTap: (){}),
            AnswerButton(answerText: "Answer 4", onTap: (){}),

          ],
        )
      ),
    );
  }

}