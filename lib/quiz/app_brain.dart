import 'question.dart';
import 'exam.dart';

var _QuestionNumber = 0;

class AppBrain {
  List<Question> _QuestionGroup = [
    Question(
      T: "number of planets in the solar system is eight planets ?",
      I: "assets/images/image-1.jpg",
      A: true,
    ),
    Question(
      T: "Are cats carnivores ?",
      I: "assets/images/image-2.jpg",
      A: true,
    ),
    Question(
      T: "Is China located in the African continent ?",
      I: "assets/images/image-3.jpg",
      A: false,
    ),
    Question(
      T: "Is the earth flat and not spherical ?",
      I: "assets/images/image-4.jpg",
      A: false,
    ),
    Question(
      T: "A person can survive without eating ?",
      I: "assets/images/image-5.jpg",
      A: false,
    ),
    Question(
      T: "The sun revolves around the earth and the earth revolves around the moon ?",
      I: "assets/images/image-6.jpg",
      A: false,
    ),
    Question(
      T: "Animals do not feel pain ?",
      I: "assets/images/image-7.jpg",
      A: false,
    ),
  ];

  void NextQuestion() {
    if (_QuestionNumber < _QuestionGroup.length - 1) {
      _QuestionNumber++;
    }
  }

  String getQuestionText() {
    return _QuestionGroup[_QuestionNumber].QuestionText;
  }

  String getQuestionImage() {
    return _QuestionGroup[_QuestionNumber].QuestionImage;
  }

  bool getQuestionAnswer() {
    return _QuestionGroup[_QuestionNumber].QuestionAnswer;
  }

  bool IsFinished() {
    if (_QuestionNumber >= _QuestionGroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _QuestionNumber = 0;
  }
}
