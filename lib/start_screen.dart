import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz ,{Key? key}) : super(key: key);

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png', 
            width: 300, height: 300,
            color: const Color.fromARGB(155, 255, 255, 255),
            ),
          const SizedBox(height: 20), // Add SizedBox
          const Text(
            'Quiz App',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20), // Add SizedBox
          ElevatedButton.icon(
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Quiz'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              textStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              startQuiz();
            },
          ),
        
        ],
      ),
    );
  }
}
