import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptr_tracker/enums/card.enum.dart';
import 'package:ptr_tracker/enums/player-color.enum.dart';
import 'package:ptr_tracker/widgets/sheet-item.widget.dart';

import '../enums/sheet.enum.dart';

class EasySheetWidget extends StatelessWidget {
  final PlayerColorEnum color;
  const EasySheetWidget(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      CardEnum.red,
      CardEnum.yellow,
      CardEnum.purple,
      CardEnum.pink,
    ];

    return Column(
      children: [
        SheetItemWidget(colors, color: color, sheet: SheetEnum.easy),
      ],
    );
  }
}
