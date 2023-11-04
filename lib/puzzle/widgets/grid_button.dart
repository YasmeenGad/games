import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridButton extends StatelessWidget {
  Function click;
  String text;

  GridButton(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: () {
        click();
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
      ),
      color: Colors.white,
    );
  }
}
