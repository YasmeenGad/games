import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var RightAnswer = 1;

AppBrain appbrain = new AppBrain();

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  static const String routeName = "home";

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Widget> answerResult = [];

  void CheckAnswer(var WhatUserPicked) {
    bool correctAnswer = appbrain.getQuestionAnswer();
    setState(() {
      if (WhatUserPicked == correctAnswer) {
        RightAnswer++;
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        answerResult.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      appbrain.NextQuestion();
    });
  }

  void showalertDialog() {
    setState(() {
      if (appbrain.IsFinished()) {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Text(
                  "The Exam is Finished",
                  style: TextStyle(fontSize: 20.sp),
                ),
                content: Text(
                  "You have answered $RightAnswer questions from 7",
                  style: TextStyle(fontSize: 30.sp),
                ),
                actions: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Start again"),
                    color: Colors.blue[400],
                  )
                ],
              );
            }));
        appbrain.reset();
        answerResult = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Exam",
          style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: answerResult,
            ),
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Image.asset(appbrain.getQuestionImage()),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    appbrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: MaterialButton(
                      height: 60.h,
                      color: Colors.indigo,
                      child: Text(
                        "True",
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        CheckAnswer(true);
                        showalertDialog();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: MaterialButton(
                      height: 60.h,
                      color: Colors.deepOrange,
                      child: Text(
                        "False",
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        CheckAnswer(false);
                        showalertDialog();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
