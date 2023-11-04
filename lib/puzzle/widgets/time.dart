import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Time extends StatelessWidget {
  int secondsPassed;

  Time(this.secondsPassed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0.h),
      child: Text(
        "Time : ${secondsPassed}",
        style: TextStyle(
            fontSize: 18.sp,
            decoration: TextDecoration.none,
            color: Colors.white),
      ),
    );
  }
}
