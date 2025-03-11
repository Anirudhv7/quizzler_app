import 'package:flutter/material.dart';
// Import the quiz logic controller
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// Create a single instance of QuizBrain to manage quiz state throughout the app
final QuizBrain quizBrain = QuizBrain();
//Main App
void main() => runApp(Quizzler());

// This is a stateless widget because its appearance doesn't change during runtime
class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    //Material App is being built
    return MaterialApp(
      home: Scaffold(
        //Back ground color of the app is being set dark gray
        backgroundColor: Colors.grey[800],
        //Safe area ensures that the icons do not go beyond the screen of the app
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            // Main quiz interface widget
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

// This is a stateful widget because it needs to update the UI based on user interactions like answering the question and etc
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  // Contains the logic for handling user interactions and updating the UI
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List to keep track of user's correct/incorrect answers with visual indicators
  List<Icon> scoreCard = [];
  // Checks if the user's answer is correct and updates the UI accordingly
  void checkAnswer(bool userPickedAnswer) {
    // Get the correct answer from the quiz brain
    bool correctAnswer = quizBrain.getQuestionAnswer();
// setState triggers a rebuild of the widget with updated values
    setState(() {
      // Check if we've reached the end of the quiz
      if (quizBrain.isFinished() == true) {
        //If the quiz has reached it's end then using rflutter_alert package there is alert being showed
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();
// Reset the quiz to the beginning
        quizBrain.reset();
// Clear the score card to start fresh
        scoreCard = [];
      } else {
        // Quiz is not finished, process the answer
        if (userPickedAnswer == correctAnswer) {
          // Add appropriate icon based on answer correctness
          scoreCard.add(Icon(
            Icons.check,
            // Green color for correct answer
            color: Colors.green,
          ));
        } else {
          scoreCard.add(Icon(
            Icons.close,
            // Red color for wrong answer
            color: Colors.red,
          ));
        }
        // Move to the next question in the quiz
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Column arranges children vertically
    return Column(
     //Space children evenly along the main axis (vertical)
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // Stretch children across the cross axis (horizontal)
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // Question text area - takes up most of the screen
      children: [
        Expanded(
          //Takes 5 portions of the available space
          flex: 5,
          //Padding is added to make it more clean and presentable
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Center(
              //Text widget is added and it is centred
              child: Text(
                 // Display current question text
                quizBrain.getQuestionText(),
                style: TextStyle(
                  //Color of the text is set to white
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
        ),
        // True button - green container with text
        Expanded(
          //Padding is added 
          child: Padding(
            padding: EdgeInsets.all(15.0),
            //Gesture Detector is added to take all the input taps
            child: GestureDetector(
              onTap: () {
              // User selected "True" answer
                checkAnswer(true);
              },
              child: Container(
                // Green background for True button
                color: Colors.green,
                child: Center(
                  child: Text(
                    'True',
                    style: TextStyle(
                      // White text for contrast
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // False button - red container with text
        Expanded(
          //Padding is added
          child: Padding(
            padding: EdgeInsets.all(15.0),
            //Gesture Detector is added to take all the input taps
            child: GestureDetector(
              onTap: () {
                 // User selected False answer
                checkAnswer(false);
              },
              child: Container(
                //Red color background for the false button
                color: Colors.red,
                child: Center(
                  child: Text(
                    'False',
                    style: TextStyle(
                      // White text for contrast
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          // Score tracker row - displays icons for correct/incorrect answers
          children: scoreCard,
        )
      ],
    );
  }
}
