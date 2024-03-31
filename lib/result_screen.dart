import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You answer X out of Y value correctly."),
            const SizedBox(
              height: 30,
            ),
            const Text("List of answers"),
            TextButton(onPressed: () {}, child: const Text("Restart Quiz!"))
          ],
        ),
      ),
    );
  }
}
