import 'question.dart';
import 'answer.dart';

class Submission {
  final String id;
  final List<Question> questions;
  final Map<String, Answer> answers; // questionId -> Answer

  Submission({
    required this.id,
    required this.questions,
    required this.answers,
  });
}