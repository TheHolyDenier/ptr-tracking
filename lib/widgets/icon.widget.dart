import 'package:flutter/material.dart';
import 'package:ptr_tracker/enums/card.enum.dart';

import '../utils/functions.utils.dart';

class IconWidget extends StatelessWidget {
  final CardEnum element;
  final double iconSize;
  const IconWidget(this.element, {Key? key, required this.iconSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: Icon(getIcon(element), color: getColor(element)),
    );
  }
}
