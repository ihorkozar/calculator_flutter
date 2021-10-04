import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  SmallCard({required this.color, this.childCard, this.onTap});

  final Color color;
  final Widget? childCard;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
