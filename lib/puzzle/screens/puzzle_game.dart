import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/grid.dart';
import '../widgets/menu.dart';
import '../widgets/mytitle.dart';

class PuzzleGame extends StatefulWidget {
  const PuzzleGame({Key? key}) : super(key: key);
  static const String routeName = "puzzleGame";

  @override
  State<PuzzleGame> createState() => _PuzzleGameState();
}

class _PuzzleGameState extends State<PuzzleGame> {
  var numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int move = 0;
  int secondPassed = 0;
  Timer? timer;
  bool isActive = false;
  static const duration = const Duration(seconds: 1);

  @override
  void initState() {
    numbers.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (timer == null) {
      timer = Timer.periodic(duration, (t) {
        startTime();
      });
    }
    return SafeArea(
      child: Container(
        height: size.height,
        color: Colors.blue,
        child: Column(
          children: [
            MyTitle(size),
            Grid(size, clickGrid, numbers),
            Menu(reset, move, secondPassed, size),
          ],
        ),
      ),
    );
  }

  void clickGrid(index) {
    if (secondPassed == 0) {
      isActive = true;
    }
    if (index - 1 >= 0 && numbers[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && numbers[index + 1] == 0 && (index + 1) % 4 != 0 ||
        index - 4 >= 0 && numbers[index - 4] == 0 ||
        index + 4 < 16 && numbers[index + 4] == 0) {
      setState(() {
        numbers[numbers.indexOf(0)] = numbers[index];
        numbers[index] = 0;
        move++;
      });
    }
    checkWin();
  }

  void reset() {
    setState(() {
      numbers.shuffle();
      move = 0;
      secondPassed = 0;
      isActive = false;
    });
  }

  void startTime() {
    if (isActive) {
      setState(() {
        secondPassed += 1;
      });
    }
  }

  bool isSorted(List list) {
    int prev = list.first;
    for (var i = 1; i < list.length - 1; i++) {
      int next = list[i];
      if (prev > next) return false;
      prev = next;
    }
    return true;
  }

  void checkWin() {
    if (isSorted(numbers)) {
      isActive = false;
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Container(
                height: 200.h,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "You Win !",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      SizedBox(
                        width: 220.0.w,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "Close",
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }
  }
}
