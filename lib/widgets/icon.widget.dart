import 'package:flutter/material.dart';
import 'package:ptr_tracker/enums/card.enum.dart';

import '../utils/consts.utils.dart';
import '../utils/functions.utils.dart';

class IconWidget extends StatelessWidget {
  final CardEnum element;

  const IconWidget(this.element, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: iconSize,
      width: iconSize,
      child: Icon(getIcon(element), color: getColor(element)),
    );
  }
}
