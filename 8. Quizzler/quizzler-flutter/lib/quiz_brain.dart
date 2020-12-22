import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBrain {
  int _questionNumber = 0;
  int _score = 0;
  // underscore before the word questionBank makes it a private variable so as to encapsulate it.
  List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  int nextQuestion(BuildContext context) {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
      return 0;
    } else {
      Alert(
          context: context,
          title: "Quiz Ended",
          desc: "Your score is $_score. Please restart to play again.",
          buttons: [
            DialogButton(
              child: Text('Restart'),
              onPressed: () {},
            ),
          ]).show();
      _score = 0;
      _questionNumber = 0;
      return 1;
    }
  }

  void incrementScore() {
    _score++;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
