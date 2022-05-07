import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptr_tracker/enums/card.enum.dart';
import 'package:ptr_tracker/enums/player-color.enum.dart';
import 'package:ptr_tracker/widgets/sheet-item.widget.dart';

class HardSheetWidget extends StatelessWidget {
  final PlayerColorEnum color;
  const HardSheetWidget(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      CardEnum.red,
      CardEnum.yellow,
      CardEnum.purple,
      CardEnum.pink,
      CardEnum.pikes,
      CardEnum.heart,
      CardEnum.tiles,
      CardEnum.clovers
    ];

    return SheetItemWidget(colors, color: color, hard: true);
  }
}
