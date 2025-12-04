import 'package:flutter/material.dart';
import '../../models/question.dart';
import '../widgets/question_card.dart';

class QuestionScreen extends StatelessWidget {
  final Question question;
  final int questionIndex;
  final int totalQuestions;
  final void Function(String) onAnswerSelected;

  const QuestionScreen({
    Key? key,
    required this.question,
    required this.questionIndex,
    required this.totalQuestions,
    required this.onAnswerSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple.shade50,
            Colors.blue.shade50,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Question ${questionIndex + 1}/$totalQuestions',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: (questionIndex + 1) / totalQuestions,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              QuestionCard(
                title: question.title,
                choices: question.choices,
                onChoiceSelected: onAnswerSelected,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
