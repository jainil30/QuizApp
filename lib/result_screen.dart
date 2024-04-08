import 'package:flutter/material.dart';
import 'package:quiz/CustomTextWidget.dart';
import 'package:quiz/data/questions.dart';

import 'questions_summary.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});

  final Function onRestart;
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_id': i,
        'questions': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }

    return summary;
  }

  final List<String> chosenAnswers;
  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numberOfTotalQuestions = questions.length;
    final numberOfCorrectAnswers = summaryData
        .where(
          (element) => element['correct_answer'] == element['user_answer'],
        )
        .length;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(6, 90, 218, 1.0),
              Color.fromRGBO(84, 145, 234, 1.0),
              Color.fromRGBO(135, 159, 245, 1.0),
            ],
          ),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You answer $numberOfCorrectAnswers out of $numberOfTotalQuestions value correctly.",
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: 400,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SingleChildScrollView(
                            child: QuestionsSummary(summaryData)),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      onRestart();
                    },
                    child: const CustomTextWidget(
                      text: "Restart Quiz!",
                      color: Colors.white,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
