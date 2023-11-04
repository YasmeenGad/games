import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/home.dart';
import 'package:games/puzzle/screens/puzzle_game.dart';
import 'package:games/quiz/exam.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: const Size(400, 810),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          routes: {
            Home.routeName: (context) => Home(),
            PuzzleGame.routeName: (context) => PuzzleGame(),
            Quiz.routeName: (context) => Quiz(),
          },
        );
      },
      child: Home(),
    );
  }
}
