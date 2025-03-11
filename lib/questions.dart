// Model class representing a quiz question
// This is a simple data class that holds the question text and its correct answer
class Question {
  // The text of the question to display to the user
  String questionText;
  // The correct answer (true/false) for the question
  bool questionAnswer;
  // Constructor with named parameters for better readability and code clarity
  // Named parameters make it clear what each value represents when creating a Question
  Question({
    // 'q' is the question text (required parameter) and 'a' is the answer (required parameter)
    required String q,
    required bool a,
    // Initialize questionText and questionAnswer with respective 
 })  : questionText = q,
        questionAnswer = a;
}
