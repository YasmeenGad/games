import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Move extends StatelessWidget {
  int move;

  Move(this.move);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0.h),
      child: Text(
        "Move : ${move}",
        style: TextStyle(
            fontSize: 18.sp,
            color: Colors.white,
            decoration: TextDecoration.none),
      ),
    );
  }
}
