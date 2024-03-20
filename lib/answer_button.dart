import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget{

  AnswerButton({ required this.answerText,required this.onTap,super.key});

  final String answerText;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(255, 255, 255,1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))
          ),
          child: Text(answerText ,style: const TextStyle(color: Colors.blueAccent, fontSize: 15),)
      ),
    );
  }


}