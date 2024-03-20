import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage(this.switchScreen,{super.key});

  void Function() switchScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromRGBO(6, 90, 218, 1.0),
                Color.fromRGBO(84, 145, 234, 1.0),
                Color.fromRGBO(135, 159, 245, 1.0),
              ],
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
                "assets/images/quiz-logo.png",
              width: 300,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: OutlinedButton.icon(
                  icon: const Icon(Icons.arrow_forward_outlined,color: Colors.white,),
                  style: ButtonStyle(
                  ),
                  onPressed: switchScreen,
                  label: const Text(
                    "Start",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
            )
          ],
        ),
      ),
    );
  }


}
