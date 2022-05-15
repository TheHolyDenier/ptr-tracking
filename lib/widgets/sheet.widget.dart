import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../enums/player-color.enum.dart';
import '../enums/sheet.enum.dart';
import '../store/game.dart';
import 'easy-sheet.widget.dart';
import 'hard-sheet.widget.dart';
import 'medium-sheet.widget.dart';

class SheetWidget extends StatefulWidget {
  final PlayerColorEnum color;
  const SheetWidget(this.color, {Key? key}) : super(key: key);

  @override
  State<SheetWidget> createState() => _SheetWidgetState();
}

class _SheetWidgetState extends State<SheetWidget> {
  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Game>(context);
    final player = game.players.find(widget.color);
    return Observer(
      builder: (_) => Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        game.newGame(widget.color, sheet: SheetEnum.easy);
                      });
                    },
                    child: const Text('NEW EASY'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        game.newGame(widget.color, sheet: SheetEnum.medium);
                      });
                    },
                    child: const Text('NEW MEDIUM'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        game.newGame(widget.color, sheet: SheetEnum.hard);
                      });
                    },
                    child: const Text('NEW HARD'),
                  )
                ],
              ),
            ),
            if (player.sheet == SheetEnum.easy) EasySheetWidget(widget.color),
            if (player.sheet == SheetEnum.medium)
              MediumSheetWidget(widget.color),
            if (player.sheet == SheetEnum.hard) HardSheetWidget(widget.color),
          ]),
    );
  }
}
