import 'package:flutter/material.dart';
import 'package:quiz/CustomTextWidget.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    Color answerColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: summaryData.map((data) {
        final questionIndex = (data['question_id'] as int?) ?? 0;
        final question = (data['questions'] as String?) ?? '';
        final userAnswer = (data['user_answer'] as String?) ?? '';
        final correctAnswer = (data['correct_answer'] as String?) ?? '';
        if (correctAnswer == userAnswer) {
          answerColor = Colors.greenAccent;
        } else {
          answerColor = Colors.redAccent;
        }
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              text: (questionIndex + 1).toString(),
              color: Colors.white,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                      text: question,
                      color: Colors.white,
                    ),
                    CustomTextWidget(
                      text: "Your answer : " + userAnswer,
                      color: answerColor,
                    ),
                    CustomTextWidget(
                      text: "Correct answer :" + correctAnswer,
                      color: Colors.greenAccent,
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
