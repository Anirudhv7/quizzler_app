# quizzler_app
A simple Flutter quiz app that tests your general knowledge with true/false questions.

# Overview
Quizzler is a true/false quiz application built with Flutter. The app presents a series of interesting trivia questions that users can answer by tapping either the "True" or "False" button. After each answer, the app provides immediate feedback by showing a green check mark for correct answers or a red X for incorrect ones.

# Features
- Clean, minimalist UI with a dark theme
- True/False questions on various trivia topics
- Visual feedback for correct and incorrect answers
- Score tracking at the bottom of the screen
- Quiz completion notification
- Ability to restart the quiz after completion

# Project Structure
The app is organized into three main files:

1. **main.dart**: Contains the UI components and main application logic
2. **question.dart**: Defines the Question model class
3. **quiz_brain.dart**: Manages the quiz state and question bank

# Dependencies
- Flutter SDK
- rflutter_alert: ^2.0.4 (for displaying the quiz completion alert)
