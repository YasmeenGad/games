import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  Function reset;

  ResetButton(this.reset);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        reset();
      },
      child: Text("Reset"),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
}
