import 'package:flutter/material.dart';


const _textColor = Colors.white;

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    Key? key,
    required this.text,
    required this.iconData,
  }) : super(key: key);

  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0,
            color: _textColor,
          ),
        )
      ],
    );
  }
}