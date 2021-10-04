import 'package:calculator_flutter/constants.dart';
import 'package:flutter/material.dart';

class BottomBtn extends StatelessWidget {
  BottomBtn({required this.onTap, required this.title});

  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap;
      },
      child: Container(
        color: kBottomCardColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomCardHeight,
        child: Center(child: Text(title, style: kTextStyle,)),
      ),
    );
  }
}