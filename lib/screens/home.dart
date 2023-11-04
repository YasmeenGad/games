import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/models/model.dart';
import 'package:games/screens/puzzle_game.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ModelGame> modelGame = [
    ModelGame(image: "assets/images/quiz.jpg", imageName: "Quiz Game"),
    ModelGame(image: "assets/images/puzzle.jpg", imageName: "Puzzle Game"),
    ModelGame(image: "assets/images/xo.jpg", imageName: "XO Game"),
    ModelGame(image: "assets/images/memoryCard.png", imageName: "Memory Card"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gaming",
                    style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    "Let's play games that you like",
                    style: TextStyle(fontSize: 20.sp, color: Colors.black54),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: double.infinity,
                    height: 250.h,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/images/logo.jpg",
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "All Categories",
                    style: TextStyle(fontSize: 25.sp, color: Colors.black),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 8,
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.5,
                                height: 170.h,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      modelGame[index].image,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .3,
                                height: 170.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      modelGame[index].imageName,
                                      style: TextStyle(
                                          fontSize: 20.sp,
                                          color: Colors.lightBlue),
                                    ),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, PuzzleGame.routeName);
                                      },
                                      child: Container(
                                        width: 110.w,
                                        height: 50.h,
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            borderRadius:
                                            BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "Let's go >>",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 20.h,
                          );
                        },
                        itemCount: modelGame.length),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
