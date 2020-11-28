import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final isActive;

  SlideDots({Key key, @required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      curve: Curves.fastOutSlowIn,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : Colors.grey[400],
        borderRadius: BorderRadius.all(Radius.circular(12.0))
      ),
      );
  }
}