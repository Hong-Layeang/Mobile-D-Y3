import '../../models/question.dart';

class QuizMockRepository {
  static List<Question> getQuestions() {
    return [
      Question(
        id: 'q1',
        title: 'Pick the correct meme duo:',
        choices: ['Sigma & Rizz', 'Salt & Pepper', 'Mario & Sonic', 'Tom & Jerry'],
        goodChoice: 'Sigma & Rizz',
      ),
      Question(
        id: 'q2',
        title: 'What do people say after a W moment?',
        choices: ['Based', 'Cringe', 'Mid', 'Sus'],
        goodChoice: 'Based',
      ),
      Question(
        id: 'q3',
        title: 'Which animal became a wholesome meme icon?',
        choices: ['Capybara', 'Koala', 'Tiger', 'Penguin'],
        goodChoice: 'Capybara',
      ),
      Question(
        id: 'q4',
        title: 'What\'s the vibe when something is “mid”?',
        choices: ['Average', 'Amazing', 'Terrible', 'Legendary'],
        goodChoice: 'Average',
      ),
      Question(
        id: 'q5',
        title: 'Which catchphrase is used to flex confidence?',
        choices: ['He\'s him', 'Oops', 'Bruh', 'Yeet'],
        goodChoice: 'He\'s him',
      ),
    ];
  }
}
