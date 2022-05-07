import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:ptr_tracker/store/game.dart';
import 'package:ptr_tracker/widgets/icon.widget.dart';
import 'package:ptr_tracker/widgets/square.widget.dart';

import '../enums/card.enum.dart';
import '../enums/player-color.enum.dart';
import '../models/pair.model.dart';
import '../utils/consts.utils.dart';

class SheetItemWidget extends StatelessWidget {
  final List<CardEnum> elements;
  final PlayerColorEnum color;

  SheetItemWidget(this.elements, {Key? key, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    List<CardEnum>? reversed = [...elements].reversed.toList();
    return Column(children: [
      Row(
        children: [
          const SizedBox(
            height: iconSize,
            width: iconSize,
          ),
          for (var i = 0; i < elements.length; i++)
            InkWell(
                child: IconWidget(elements[i]),
                onTap: () => game.markAllPairs(color,
                    card: elements[i],
                    options: reversed.sublist(0, reversed.length - i))),
        ],
      ),
      for (var i = 0; i < reversed.length; i++)
        Row(
          children: [
            InkWell(
                child: IconWidget(reversed[i]),
                onTap: () => game.markAllPairs(color,
                    card: reversed[i],
                    options: elements.sublist(0, elements.length - i))),
            for (var j = 0; j < elements.length - i; j++)
              InkWell(
                child: Observer(
                  builder: (_) => SquareWidget(game.players
                      .find(color)
                      .existsInList(Pair(elements[j], reversed[i]))),
                ),
                onTap: () => game.switchPair(color,
                    pair: Pair(elements[j], reversed[i])),
              )
          ],
        )
    ]);
  }
}
