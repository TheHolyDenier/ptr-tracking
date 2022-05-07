import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ptr_tracker/enums/card.enum.dart';
import 'package:ptr_tracker/enums/player-color.enum.dart';
import 'package:ptr_tracker/widgets/sheet-item.widget.dart';

class MediumSheetWidget extends StatelessWidget {
  const MediumSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      CardEnum.red,
      CardEnum.yellow,
      CardEnum.purple,
      CardEnum.pink,
    ];
    final cards = [
      CardEnum.pikes,
      CardEnum.heart,
      CardEnum.tiles,
      CardEnum.clovers
    ];

    return Column(
      children: [
        SheetItemWidget(colors, color: PlayerColorEnum.green),
        SheetItemWidget(cards, color: PlayerColorEnum.green),
      ],
    );
  }
}
