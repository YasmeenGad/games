import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  var size;

  MyTitle(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      padding: EdgeInsets.all(5),
      child: Text(
        "Sliding Puzzle",
        style: TextStyle(
            fontSize: size.height * 0.05,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            color: Colors.white),
      ),
    );
  }
}
