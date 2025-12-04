class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question({
    required this.id,
    required this.title,
    required this.choices,
    required this.goodChoice,
  });
}