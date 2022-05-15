import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ptr_tracker/store/game.dart';
import 'package:ptr_tracker/widgets/icon.widget.dart';
import 'package:ptr_tracker/widgets/square.widget.dart';

import '../enums/card.enum.dart';
import '../enums/player-color.enum.dart';
import '../enums/sheet.enum.dart';
import '../models/pair.model.dart';

class SheetItemWidget extends StatelessWidget {
  final List<CardEnum> elements;
  final PlayerColorEnum color;
  final SheetEnum sheet;

  const SheetItemWidget(this.elements,
      {Key? key, required this.color, this.sheet = SheetEnum.medium})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    final iconSize =
        MediaQuery.of(context).size.width / (sheet == SheetEnum.hard ? 10 : 6);
    List<CardEnum>? reversed = [...elements].reversed.toList();
    return Column(children: [
      Row(
        children: [
          SizedBox(
            height: iconSize,
            width: iconSize,
          ),
          for (var i = 0; i < elements.length; i++)
            InkWell(
                child: IconWidget(elements[i], iconSize: iconSize),
                onTap: () => game.markAllPairs(color,
                    card: elements[i],
                    options: reversed.sublist(0, reversed.length - i))),
        ],
      ),
      for (var i = 0; i < reversed.length; i++)
        Row(
          children: [
            InkWell(
                child: IconWidget(reversed[i], iconSize: iconSize),
                onTap: () => game.markAllPairs(color,
                    card: reversed[i],
                    options: elements.sublist(0, elements.length - i))),
            for (var j = 0; j < elements.length - i; j++)
              InkWell(
                child: Observer(
                  builder: (_) => SquareWidget(
                      game.players
                          .find(color)
                          .existsInList(Pair(elements[j], reversed[i])),
                      iconSize: iconSize),
                ),
                onTap: () => game.switchPair(color,
                    pair: Pair(elements[j], reversed[i])),
              )
          ],
        )
    ]);
  }
}
