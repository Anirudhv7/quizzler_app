import 'questions.dart';
//This class is responsible for managing the quiz logic and state
// This class acts as the "brain" of the quiz, handling:
// - Storing all questions
// - Tracking the current question
// - Providing methods to navigate through questions
// - Checking quiz completion status
class QuizBrain {
  // Private variable to track current question index
  int _questionNumber = 0;
  // Private list of all quiz questions
  // This is the question bank containing all the trivia questions and answers
  final List<Question> _questionBank = [
     // Each Question object contains the question text and the correct 
    Question(
      q: 'You can lead a cow down the stairs but not up the stairs.',
      a: false,
    ),
    Question(
      q: 'Approximately one quater of human bones are feet.',
      a: true,
    ),
    Question(
      q: 'A slug\'s blood is green.',
      a: true,
    ),
    Question(q: 'Some cats are actually allergic to humans', a: true),
    Question(q: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', a: true),
    Question(q: 'It is illegal to pee in the Ocean in Portugal.', a: true),
    Question(
        q: 'No piece of square dry paper can be folded in half more than 7 times.',
        a: false),
    Question(
        q: 'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        a: true),
    Question(
        q: 'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        a: false),
    Question(
        q: 'The total surface area of two human lungs is approximately 70 square metres.',
        a: true),
    Question(q: 'Google was originally called \"Backrub\".', a: true),
    Question(
        q: 'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        a: true),
    Question(
        q: 'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        a: true),
  ];

  // Advances to the next question if not at the end of the quiz
  // This method increments the question number to move to the next question but only if there are more questions available
  void nextQuestion() {
    // Check if the user is not already at the last question
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      // If the user is already at the last question, do nothing this prevents index out of bounds errors
    }
  }

  // Returns the text of the current question
  // This method provides access to the current question text without exposing the entire question bank
  String getQuestionText() {
    // Access the current question using the _questionNumber index and return its text property
    return _questionBank[_questionNumber].questionText;
  }
  // Returns the correct answer for the current question
  // This method provides access to the current question's answer without exposing the entire question bank
  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
 // Checks if the user has reached the last question in the quiz
  // Returns true if the current question is the last one, false otherwise
  bool isFinished() {
    // Check if the current question number is at or beyond the last index
    if (_questionNumber >= _questionBank.length - 1) {
      // The user has reached the end of the quiz
      return true;
    } else {
      // There are still more questions
      return false;
    }
  }
 // Resets the quiz to the first question
  void reset() {
    _questionNumber = 0;
  }
}
