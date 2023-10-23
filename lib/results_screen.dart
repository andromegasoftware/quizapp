import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key, 
    required  this.selectedAnswers,
    });

  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summaryData = []; 
    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add(
        {
          'question_index': i,
          'question': questions[i],
          'correct_answer': questions[i].answers[0], 
          'selected_answer': selectedAnswers[i],
        },
      );
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {

    final summaryData = getSummaryData();
    final numberTotalQuestions = questions.length;
    final numberCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['selected_answer'];
    
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $numberCorrectAnswers out of $numberTotalQuestions questions correctly!', style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
                  textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summaryData: getSummaryData(),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, 
            child: const Text('Restart Quiz', style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),),
            )
          ],
        ),
      ),
    );
  }
}
