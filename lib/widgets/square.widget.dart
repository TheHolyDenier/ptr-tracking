import 'package:flutter/material.dart';

class SquareWidget extends StatelessWidget {
  final bool selected;
  final double iconSize;
  const SquareWidget(this.selected, {Key? key, required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: iconSize,
      width: iconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: selected ? Colors.black12 : Colors.white,
        boxShadow: const [
          BoxShadow(color: Colors.black12, spreadRadius: 1),
        ],
      ),
    );
  }
}
